import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/routes/app_pages.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PanelController panelController = PanelController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.viewBody[controller.currentIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavyBar(
          selectedIndex: controller.currentIndex.value,
          showElevation: true,
          containerHeight: 60,
          itemCornerRadius: 16,
          curve: Curves.easeIn,
          onItemSelected: (index) {
            if (index == 1) {
              Get.toNamed(Routes.OCR);
            }
            controller.currentIndex.value = index;
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text('Home'),
              activeColor: Colors.green,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.camera),
              title: const Text('Scan'),
              activeColor: Colors.green,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
              activeColor: Colors.green,
              textAlign: TextAlign.center,
            ),
          ],
        );
      }),
    );
  }
}
