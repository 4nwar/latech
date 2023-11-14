import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halalin/app/data/services/service_preferences.dart';

import 'app/routes/app_pages.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();

  cameras = await availableCameras();

  runApp(
    GetMaterialApp(
      title: "Latech App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );

  //hapus pakage icon_akar, sharedpreference dan teseract
}
