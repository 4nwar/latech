
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/modules/main/views/tabs/news/controllers/news_controller.dart';
import 'package:halalin/app/ui/newsCard_widget.dart';
import 'package:iconsax/iconsax.dart';

class NewsView extends GetView<NewsController> {

  NewsView({super.key});
  

  @override
  Widget build(BuildContext context) {
    //argument Get

    final NewsController newsController = Get.put(NewsController());
    Get.put(NewsController());
    return DefaultTabController(length: newsController.tabs.length, child:Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Latech - Halal Article'
        ),
        // centerTitle: true,
        backgroundColor: primary,
        bottom: TabBar(
          tabs: newsController.tabs,
          isScrollable: false,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
        ),
        actions: <Widget>[
          Icon(Iconsax.search_normal, color: Colors.white,),
          SizedBox(width: 12,)
        ],
      ),
      body: TabBarView(
        children: newsController.tabs.map((model) => NewsCardWidget()).toList(), 
        ),
      ),
    );
  }
}