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
      text: 'Article',
    ));
    tabs.add(Tab(
      text: 'News',
    ));
    tabs.add(Tab(
      text: 'MSE - Corner',
    ));
    fetchData('Article'); // Mengambil data untuk tab pertama saat inisialisasi
  }

  void fetchData(String category) async {
    try {
      isLoading(true); // Set isLoading menjadi true saat memuat data
      final service = NewsService();
      final data = await service.fetchNewsData(category);

      if (category == 'Article') {
        articlesData.assignAll(data);
      } else if (category == 'News') {
        newsData.assignAll(data);
      } else if (category == 'MSE - Corner') {
        ukmData.assignAll(data);
      }
    } catch (e) {
      // Handle error
    } finally {
      isLoading(false); // Set isLoading menjadi false setelah selesai
    }
  }
}
