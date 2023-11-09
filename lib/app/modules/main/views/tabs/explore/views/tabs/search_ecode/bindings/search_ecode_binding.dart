
import 'package:get/get.dart';

import '../controllers/search_ecode_controller.dart';

class SearchEcodeBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<SearchEcodeController>(
      () => SearchEcodeController()
    );
  }
  
}