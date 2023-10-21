import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/modules/main/views/main_view.dart';
import 'package:halalin/app/routes/app_pages.dart';

class SplashScreenController extends GetxController{
  var opacity = 1.0.obs;

  @override
  void onInit() {
    //
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void movePage() {
    Future.delayed(const Duration(seconds: splashDuration))
        .then((value) => Get.offNamed(Routes.MAIN));
  }

  Widget homeView() {
    return MainView();
  }
}
