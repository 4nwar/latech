import 'package:get/get.dart';
import 'package:halalin/app/modules/main/views/tabs/news/controllers/news_controller.dart';

class NewsBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
  }
}