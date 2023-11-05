import 'package:dio/dio.dart';
import 'package:halalin/app/data/models/News_detail.dart';
import 'package:halalin/app/data/models/ecode.dart';

class NewsDetailService {
  final Dio _dio = Dio();

  //bisajadi ga kepake
  
  // Future<List<NewsDetailModel>> fetchNewsDetailData(String link) async {
  //   try {
  //     final response = await _dio
  //         .get('http://192.168.100.38/api-halal-mui/pagination/detail/', //perbaiki alamat
  //             queryParameters: {"url": link});
  //     if (response.statusCode == 200) {
  //       final jsonData = response.data as List<dynamic>;
  //       return jsonData.map((item) => NewsDetailModel.fromJson(item)).toList();
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load data: $e');
  //   }
  // }
}
