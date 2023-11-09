
import 'package:get/get.dart';
import 'package:halalin/app/data/models/News_detail.dart';
import 'package:halalin/app/data/services/NewsDetail_service.dart';

import '../../../data/services/NewsService.dart';

class DetailNewsController extends GetxController {
  // final count = 0.obs;
  var isLoading = true.obs;
  final detailNewslist = <NewsDetailModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchDetailData(String link) async {
    try {
      isLoading(true);
      final service = NewsDetailService();
      final data = await service.fetchNewsDetailData(link);
      detailNewslist.clear(); // Bersihkan daftar yang ada jika perlu
      detailNewslist
          .add(data); // Tambahkan objek NewsDetailModel ke dalam daftar
    } catch (e) {
      print(e);
      throw e;
    } finally {
      isLoading(false);
    }
  }

  //data berhasil diambil namun eror

  // Future<void> fetchDetailData(String link) async {
  //   try {
  //     isLoading(true); // Set isLoading menjadi true saat memuat data
  //     final service = NewsDetailService();
  //     final data = await service.fetchNewsDetailData(link);
  //     detailNewslist.value = data as List<NewsDetailModel>; // Gunakan detailNews.value untuk menetapkan data
  //   } catch (e) {
  //     // Handle error
  //     print(e);
  //     throw e;
  //   } finally {
  //     isLoading(false); // Set isLoading menjadi false setelah selesai
  //   }
  // }


  
  // void fetchDetailData(String link) async {
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