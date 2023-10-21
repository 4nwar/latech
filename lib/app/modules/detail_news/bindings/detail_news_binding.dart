
import 'package:get/get.dart';
import 'package:halalin/app/modules/detail_news/controllers/detail_news_controller.dart';
import 'package:halalin/app/modules/main/views/tabs/news/controllers/news_controller.dart';

class DetailNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNewsController>(
      () => DetailNewsController(),
    );
  }
}