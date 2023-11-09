import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/ecode.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/data/services/ecode_service.dart';
import 'package:halalin/app/data/services/halal_services.dart';
import 'package:halalin/app/routes/app_pages.dart';
import 'package:halalin/app/ui/status.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../ui/ecodeCard_widget.dart';
import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  ResultView({Key? key}) : super(key: key);
  
  // final ecodeList = <EcodeModel>[].obs;
  @override
  Widget build(BuildContext context) {
    // final ecodeList = <EcodeModel>[].obs;
    File inputFile = Get.arguments;
    final TextRecognizer textRecognizer =
        TextRecognizer(script: TextRecognitionScript.chinese);
    InputImage? inputImage;

    inputImage = InputImage.fromFilePath(inputFile.path);

    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.OCR);
        return false;
      },
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: primaryAccent,
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.OCR);
              },
              icon: const Icon(
                Iconsax.arrow_left,
                color: Colors.black,
              )),
          centerTitle: true,
          title: Text(
            resultViewAppbarTitle,
            style: textCustom(mediumFont, 18, Colors.black),
          ),
        ),
        body: FutureBuilder<RecognizedText>(
          future: textRecognizer.processImage(inputImage),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              return Stack(
                children: [
                  SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.file(
                        inputFile,
                        fit: BoxFit.cover,
                      )),
                  bottomResult(context, snapshot),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  SlidingUpPanel bottomResult(
      BuildContext context, AsyncSnapshot<RecognizedText> snapshot) {
    return SlidingUpPanel(
      controller: controller.slidingController,
      minHeight: 60,
      isDraggable: true,
      backdropEnabled: true,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      header: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: IconButton(
            onPressed: () {
              if (controller.slidingController.panelPosition == 1) {
                controller.slidingController.animatePanelToPosition(0);
              } else {
                controller.slidingController.animatePanelToPosition(1);
              }
            },
            icon: const Icon(Iconsax.arrow_circle_up)),
      ),
      panel: Container(
        decoration: BoxDecoration(
            color: primaryAccent,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60))),
        child: ListView(
          children: [
            Container(
              color: Colors.transparent,
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Text(
                'Recognized Image :',
                textAlign: TextAlign.justify,
                style: textCustom(semiBoldFont, 20, Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(snapshot.data!.text, textAlign: TextAlign.justify),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Text(
                'E-CODE Inggredients :',
                textAlign: TextAlign.justify,
                style: textCustom(semiBoldFont, 20, Colors.black),
              ),
            ),
            (snapshot.data != null)
                ? FutureBuilder<List<EcodeModel>>(
                    future: EcodeService.getEcodeHalal(input: snapshot.data!.text),
                    // future: HalalServices.getHalal(input: snapshot.data!.text),
                    builder: (context, ingredients) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        if (ingredients.data == null) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              'Result Is Empty ',
                              textAlign: TextAlign.justify,
                              style: textCustom(regularFont, 16, Colors.black),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Container(
                            color: primaryAccent,
                            height: (200.0 * ingredients.data!.length),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: ingredients.data!.length,
                              itemBuilder: (context, index) {
                                var dataResult = ingredients.data![index];
                                return SizedBox(
                                  height: 160,
                                  child: buildEcodeCard(dataResult, context),
                                );
                                // return Padding(
                                //   padding:
                                //       const EdgeInsets.symmetric(vertical: 16),
                                //   child: Stack(
                                //     children: [
                                //       Image.asset(resultCard),
                                //       Padding(
                                //         padding: const EdgeInsets.all(26.0),
                                //         child: SizedBox(
                                //           height: 100,
                                //           child: Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Text(dataResult.name,
                                //                   style: const TextStyle(
                                //                       fontSize: 14)),
                                //               Text(
                                //                 //ini saya rubah kode ke id
                                //                 dataResult.id,
                                //                 style: const TextStyle(
                                //                     fontSize: 20,
                                //                     fontWeight:
                                //                         FontWeight.w600),
                                //               ),
                                //               Row(
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment
                                //                           .spaceBetween,
                                                  // children: label(
                                                      // ingred: dataResult)),
                                //             ],
                                //           ),
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  )
                : const Text('Result is Empty !')
          ],
        ),
      ),
    );
  }
}
