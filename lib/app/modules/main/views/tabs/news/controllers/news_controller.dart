
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsController extends GetxController{

  RxList<Widget> tabs = RxList();
  
  @override
  void onInit() {
    super.onInit();
    tabs.add(Tab(text: 'Article',));
    tabs.add(Tab(text: 'News',));
    tabs.add(Tab(text: 'MSE - Corner',));
  }
}