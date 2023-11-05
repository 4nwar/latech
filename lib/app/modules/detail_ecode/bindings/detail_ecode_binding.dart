
import 'package:get/get.dart';
import 'package:halalin/app/modules/detail_ecode/controllers/detail_ecode_controller.dart';

class DetailEcodeBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<DetailEcodeController>(() => DetailEcodeController());
  }
}