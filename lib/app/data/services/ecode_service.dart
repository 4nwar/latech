import 'package:dio/dio.dart';
import 'package:halalin/app/data/models/ecode.dart';

class EcodeService {
  final Dio _dio = Dio();

  Future<List<EcodeModel>> fetchAllEcodeData(String ecode) async {
    try {
      final response = await _dio
          .get('http://192.168.100.38/api-halal-mui/ecode/', //perbaiki alamat
              queryParameters: {"ecode": ecode});
      if (response.statusCode == 200) {
        final jsonData = response.data as List<dynamic>;
        return jsonData.map((item) => EcodeModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
