import 'package:get/get.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/dashboard.dart';

import '../../../../../../data/models/ecode.dart';
import '../../../../../../data/services/ecode_service.dart';

class DashboardController extends GetxController {
    List<ThumbArticle> thumbnail = [
      ThumbArticle(txt: textTumbarticle, img: thumbArticle, cat:"Article"),
      ThumbArticle(txt: textTumbNews, img: thumbNews, cat: "News"),
      ThumbArticle(txt: textTumbUkm, img: thumbUkm, cat: "Sem-Corner"),
    ];

    final ecodeService = EcodeService();
    final ecodeList = <EcodeModel>[].obs;
    final isLoading = false.obs;

  Future<void> ThumbEcode() async {
    try {
      // print("Ecode List Length: ${ecodeList.length}");
      isLoading.value = true;
      final List<EcodeModel> ecodes = await ecodeService.fetchAllEcodeData("");
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
    ThumbEcode();
  }

  @override
  void onReady() {
    super.onReady();
    ThumbEcode();
  }

  @override
  void onClose() {
    super.onClose();
  }
}