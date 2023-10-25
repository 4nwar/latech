
import 'package:get/get.dart';
import 'package:halalin/app/modules/search_product/controllers/search_product_controller.dart';

class SearchProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchProductController>(
      () => SearchProductController(),
    );
  }
  
}