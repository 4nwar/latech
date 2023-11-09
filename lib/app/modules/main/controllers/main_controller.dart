import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/data/services/halal_services.dart';
import 'package:halalin/app/modules/main/views/tabs/about/views/about_view.dart';
import 'package:halalin/app/modules/main/views/tabs/bookmark/views/bookmark_view.dart';
import 'package:halalin/app/modules/main/views/tabs/dashboard/views/dashboard_view.dart';
import 'package:halalin/app/modules/main/views/tabs/explore/views/explore_view.dart';
import 'package:halalin/app/modules/main/views/tabs/home/views/home_view.dart';
import 'package:halalin/app/modules/main/views/tabs/news/views/news_view.dart';
import 'package:image_picker/image_picker.dart';

class MainController extends GetxController {
  RxList<Ingredient> data = RxList();
  RxList<Ingredient> result = RxList();
  final RxInt currentIndex = 0.obs;
  List<Widget> viewBody = [
    DashboardView(),
    ExploreView(),
    Container(),
    const BookmarkView(),
    AboutView(),
  ];

  RxString ocrText = ''.obs;
  String lang = "eng";
  RxString path = "".obs;
  RxBool bload = false.obs;

  Future<void> getData() async {
    data.clear();
  }

  Future<List<Ingredient>> getResult({required String input}) async {
    await getData();
    result.clear();
    var res = await HalalServices.getHalal(input: input);
    result.addAll(res);
    return res;
  }

  // Future<List<Ingredient>> ocr(url) async {
  //   path.value = url;
  //   bload.value = true;

  //   ocrText.value =
  //       await FlutterTesseractOcr.extractText(url, language: lang, args: {
  //     "preserve_interword_spaces": "1",
  //   });
  //   print(ocrText.value);
  //   List<Ingredient> res = await getResult(input: ocrText.value);
  //   print(res);
  //   bload.value = false;
  //   return res;
  // }

  Future<List<Ingredient>> ocr(url) async {
    path.value = url;
    bload.value = true;
    RecognizedText? recognizedText;

    final inputImage = InputImage.fromFilePath(url);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    recognizedText =
        await textRecognizer.processImage(inputImage);

    ocrText.value = recognizedText.text;
    print(ocrText.value);
    List<Ingredient> res = await getResult(input: ocrText.value);
    print(res);

    textRecognizer.close(); // Tutup text recognizer setelah selesai

    bload.value = false;
    return res;
  }

  void runFilePiker() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      ocr(pickedFile.path);
    }
  }
}
