import 'package:dio/dio.dart';

import '../models/NewsItem.dart';

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
        final jsonData = response.data['data']['datas'] as List<dynamic>;
        return jsonData.map((item) => NewsItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
