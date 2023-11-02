import 'package:get/get.dart';
import 'package:halalin/app/data/models/ecode.dart';
import 'package:halalin/app/data/services/ecode_service.dart';

class SearchEcodeController extends GetxController {
  final count = 0.obs;

  final ecodeService = EcodeService();
  final ecodeList = <EcodeModel>[].obs;
  final isLoading = false.obs;

  Future<void> searchEcode(String ecodeV) async {
    try {
      isLoading.value = true;
      final ecodes = await ecodeService.fetchAllEcodeData(ecodeV);
      ecodeList.assignAll(ecodes);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}