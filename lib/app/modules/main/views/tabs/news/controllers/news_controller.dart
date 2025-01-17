import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../../data/models/NewsItem.dart';
import '../../../../../../data/services/NewsService.dart';

class NewsController extends GetxController {
  RxList<Widget> tabs = RxList();
  var isLoading = true.obs;
  var newsData = <NewsItem>[].obs;
  var articlesData = <NewsItem>[].obs;
  var ukmData = <NewsItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabs.add(Tab(
      text: 'article',
    ));
    tabs.add(Tab(
      text: 'news',
    ));
    tabs.add(Tab(
      text: 'ukm',
    ));
    fetchData('article'); 
    fetchData('news'); 
    fetchData('ukm'); 
  }

  void fetchData(String category) async {
    try {
      isLoading(true); // Set isLoading menjadi true saat memuat data
      final service = NewsService();
      final data = await service.fetchNewsData(category);

      if (category == 'article') {
        articlesData.assignAll(data);
      } else if (category == 'news') {
        newsData.assignAll(data);
      } else if (category == 'ukm') {
        ukmData.assignAll(data);
      }
    } catch (e) {
      // Handle error
      print(e);
    } finally {
      isLoading(false); // Set isLoading menjadi false setelah selesai
    }
  }
}
