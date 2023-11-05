import 'package:dio/dio.dart';

import '../models/NewsItem.dart';
import '../models/News_detail.dart';

class NewsService {
  final Dio _dio = Dio();

  Future<List<NewsItem>> fetchNewsData(String category) async {
    try {
      final response = await _dio
          .get('http://192.168.100.38/api-halal-mui/kategori/cat', //perbaiki alamat
          queryParameters: {
            "category" : category,
            "page" :1
          }
          );
      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data != null) {
          final jsonData = data['datas'] as List<dynamic>;
          if (jsonData != null) {
            return jsonData.map((item) => NewsItem.fromJson(item)).toList();
          } else {
            throw Exception('Data "datas" is null.');
          }
        } else {
          throw Exception('Data "data" is null.');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<List<NewsDetailModel>> fetchNewsDetailData(String link) async {
    try {
      final response = await _dio.get(
          'http://192.168.100.38/api-halal-mui/pagination/detail/', //perbaiki alamat
          queryParameters: {"url": link});
      if (response.statusCode == 200) {
        final jsonData = response.data as List<dynamic>;
        return jsonData.map((item) => NewsDetailModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
