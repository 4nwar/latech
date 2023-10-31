
import 'package:get/get.dart';
import 'package:halalin/app/modules/search_ecode/controllers/search_ecode_controller.dart';

class SearchEcodeBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<SearchEcodeController>(
      () => SearchEcodeController()
    );
  }
  
}