import 'package:dio/dio.dart';

import '../models/NewsItem.dart';

class NewsService {
  final Dio _dio = Dio();

  Future<List<NewsItem>> fetchNewsData(String category) async {
    try {
      final response = await _dio
          .get('http://localhost/api-halal-mui/kategori?category=$category');
      if (response.statusCode == 200) {
        final jsonData = response.data as List<dynamic>;
        return jsonData.map((item) => NewsItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
