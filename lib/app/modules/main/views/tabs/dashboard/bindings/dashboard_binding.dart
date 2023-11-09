import 'package:get/get.dart';
import 'package:halalin/app/modules/main/views/tabs/dashboard/controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}