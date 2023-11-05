
import 'package:get/get.dart';
import 'package:halalin/app/data/models/News_detail.dart';

import '../../../data/services/NewsService.dart';

class DetailNewsController extends GetxController {
  // final count = 0.obs;
  var isLoading = true.obs;
  final detailNewslist = <NewsDetailModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  
  Future<List<NewsDetailModel>> fetchDetailData(String link) async {
    try {
      isLoading(true);
      final service = NewsService();
      final data = await service.fetchNewsDetailData(link);
      detailNewslist.assignAll(data);
      return data; // Mengembalikan data detail
    } catch (e) {
      print(e);
      throw e;
    } finally {
      isLoading(false);
    }
  }
  
  // void fetchDeatilData(String link) async {
  //   try {
  //     isLoading(true); // Set isLoading menjadi true saat memuat data
  //     final service = NewsService();
  //     final data = await service.fetchNewsDetailData(link);
  //     detailNewslist.assignAll(data);
  //   } catch (e) {
  //     // Handle error
  //     print(e);
  //   } finally {
  //     isLoading(false); // Set isLoading menjadi false setelah selesai
  //   }
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}