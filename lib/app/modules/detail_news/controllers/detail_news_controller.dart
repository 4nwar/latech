import 'package:get/get.dart';
import 'package:halalin/app/data/models/News_detail.dart';
import 'package:halalin/app/data/services/NewsDetail_service.dart';
import 'package:halalin/app/data/services/local/Database.dart';

class DetailNewsController extends GetxController {
  var isLoading = true.obs;
  var isBookmarked = false.obs;
  final detailNewslist = <NewsDetailModel>[].obs;
  RxList<NewsDetailModel> news = RxList();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchDetailData(String link) async {
    try {
      isLoading(true);
      final service = NewsDetailService();
      final data = await service.fetchNewsDetailData(link);
      detailNewslist.clear();
      detailNewslist.add(data);
      // Check if the article is bookmarked
      isBookmarked.value =
          await NewsDatabase.instance.isBookmarkExists(data.title);
    } catch (e) {
      print(e);
      throw e;
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateSaveDataBookmarkNews() async {
    try {
      if (detailNewslist.isNotEmpty) {
        if (isBookmarked.value) {
          await NewsDatabase.instance
              .deleteBookmark(detailNewslist.first.title);
        } else {
          await NewsDatabase.instance.insertBookmark(detailNewslist.first);
        }
        isBookmarked.toggle(); // Toggle the bookmark status
      }
    } catch (e) {
      print("Error updating bookmark status: $e");
    }
  }

  Future<void> saveToDatabase() async {
    try {
      if (detailNewslist.isNotEmpty) {
        await NewsDatabase.instance.insertBookmark(detailNewslist.first);
        isBookmarked.value = true;
        // Optionally show a success message or perform other actions after saving
      }
    } catch (e) {
      print("Error saving to database: $e");
    }
  }

  Future<void> removeFromDatabase() async {
    try {
      if (detailNewslist.isNotEmpty) {
        await NewsDatabase.instance.deleteBookmark(detailNewslist.first.title);
        isBookmarked.value = false;
        // Optionally show a success message or perform other actions after removing
      }
    } catch (e) {
      print("Error removing from database: $e");
    }
  }

  @override
  void onClose() {
    // Close the database when the controller is disposed to avoid memory leaks
    // NewsDatabase.instance.close();
    super.onClose();
  }
}
