import 'package:dio/dio.dart';
import 'package:halalin/app/data/models/News_detail.dart';
import 'package:sqflite/sqflite.dart';
import 'config/api_service.dart';
import 'local/Database.dart';

class NewsDetailService {
  final Dio _dio = Dio();

  //bisajadi ga kepake
  Future<NewsDetailModel> fetchNewsDetailData(String link) async {
    try {
      final response = await _dio.get(
          '${ApiService.baseUrl}artikel/detail/',
          queryParameters: {"url": link});

      if (response.statusCode == 200) {
        final jsonData =
            response.data['data']; // Access the 'data' key in the response
        return NewsDetailModel.fromJson(jsonData);
      } else {
        throw Exception('Gagal mengambil data');
      }
    } catch (e) {
      throw Exception('Gagal mengambil data: $e');
    }
  }

  // static Future<void> savedDataBookmarkNews(
  //     {required NewsDetailModel newsDetail}) async {
  //   final db = await NewsDatabase.instance.database;
  //   if (newsDetail.is_bookmark == 'true') {
  //     await db.insert(
  //       NewsDatabase.tableBookmark,
  //       newsDetail.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.replace,
  //     );
  //   } else {
  //     await db.delete(
  //       NewsDatabase.tableBookmark,
  //       where: '${NewsDatabase.columnTitle} = ?',
  //       whereArgs: [newsDetail.title],
  //     );
  //   }
  // }
}
