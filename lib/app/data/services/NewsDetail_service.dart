import 'package:dio/dio.dart';
import 'package:halalin/app/data/models/News_detail.dart';
import 'package:halalin/app/data/models/ecode.dart';

import 'config/api_service.dart';

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
  //  Future<NewsDetailModel> fetchNewsDetailData(String url) async {
  //   try {
  //     final response = await _dio.get(
  //         'http://192.168.100.38/api-halal-mui/pagination/detail/',
  //         queryParameters: {"url": url});
  //     if (response.statusCode == 200) {
  //       return NewsDetailModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load data: $e');
  //   }
  // }
}
