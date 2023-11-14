import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/data/services/halal_services.dart';
import 'package:halalin/app/ui/text_detector_painter.dart';

import '../../../../../../ui/camera_view.dart';

class TextRecognizerView extends StatefulWidget {
  const TextRecognizerView({Key? key}) : super(key: key);

  @override
  State<TextRecognizerView> createState() => _TextRecognizerViewState();
}

class _TextRecognizerViewState extends State<TextRecognizerView> {
  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  RecognizedText? recognizedText;
  final List<Ingredient> _listIngredient = [];

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      // title: 'Text Detector',
      customPaint: _customPaint,
      text: _text,
      onImage: (inputImage) {
        processImage(inputImage);
      },
      textWidget: result(),
    );
  }

  // Future<void> processImage(InputImage inputImage) async {
  //   if (!_canProcess) return;
  //   if (_isBusy) return;
  //   _isBusy = true;
  //   setState(() {
  //     _text = '';
  //   });
  //   recognizedText = await _textRecognizer.processImage(inputImage);

  //   // _listIngredient?.clear();
  //   // for (final textBlock in recognizedText!.blocks) {
  //   //   List<Ingredient> res =
  //   //       await HalalServices.getHalal(input: textBlock.text);
  //   //   _listIngredient?.addAll(res);
  //   // }
  //   // print(_listIngredient);

  //   if (inputImage.inputImageData?.size != null &&
  //       inputImage.inputImageData?.imageRotation != null) {
  //     final painter = TextRecognizerPainter(
  //         recognizedText!,
  //         inputImage.inputImageData!.size,
  //         inputImage.inputImageData!.imageRotation);
  //     _customPaint = CustomPaint(painter: painter);
  //   } else {
  //     _text = 'Recognized text:\n\n${recognizedText!.text}';
  //     _customPaint = null;
  //   }
  //   _isBusy = false;
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  //saya mengganti yang atas dengan ini dan merubah cameraview dengan statefull
  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;

    recognizedText = await _textRecognizer.processImage(inputImage);

    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = TextRecognizerPainter(
          recognizedText!,
          inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation);
      _customPaint = CustomPaint(painter: painter);
    } else {
      _text = 'Recognized text:\n\n${recognizedText!.text}';
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  Widget result() {
    if (recognizedText != null) {
      for (final textBlock in recognizedText!.blocks) {
        return FutureBuilder<List<Ingredient>>(
          future: HalalServices.getHalal(input: textBlock.text),
          builder: (context, snapshot) {
            return Text(snapshot.data.toString());
          },
        );
      }
    }
    setState(() {});
    return Container();
  }
}
