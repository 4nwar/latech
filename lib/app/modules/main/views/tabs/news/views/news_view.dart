import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/modules/main/views/tabs/news/controllers/news_controller.dart';
import 'package:halalin/app/ui/newsCard_widget.dart';
import 'package:iconsax/iconsax.dart';

class NewsView extends GetView<NewsController> {
  NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());

    return DefaultTabController(
      length: newsController.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text('Latech - Halal Article'),
          backgroundColor: primary,
          bottom: TabBar(
            tabs: newsController.tabs,
            isScrollable: false,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
          ),

          //search Icon
          // actions: <Widget>[
          //   Icon(
          //     Iconsax.search_normal,
          //     color: Colors.white,
          //   ),
          //   SizedBox(
          //     width: 12,
          //   )
          // ],
        ),

        body: TabBarView(
          children: [
            Obx(() {
              if (newsController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: newsController.articlesData.length,
                  itemBuilder: (context, index) {
                    final data = newsController.articlesData[index];
                    return NewsCardWidget(newsItem: data);
                  },
                );
              }
            }),
            Obx(() {
              if (newsController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: newsController.newsData.length,
                  itemBuilder: (context, index) {
                    final data = newsController.newsData[index];
                    return NewsCardWidget(newsItem: data);
                  },
                );
              }
            }),
            Obx(() {
              if (newsController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: newsController.ukmData.length,
                  itemBuilder: (context, index) {
                    final data = newsController.ukmData[index];
                    return NewsCardWidget(newsItem: data);
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
