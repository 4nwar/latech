import 'package:dio/dio.dart';
import 'package:halalin/app/data/models/ecode.dart';

import 'config/api_service.dart';

class EcodeService {
  final Dio _dio = Dio();

  Future<List<EcodeModel>> fetchAllEcodeData(String ecode) async {
    try {
      final response = await _dio
          .get('${ApiService.baseUrl}ecode/', //perbaiki alamat
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
// get result data
  static Future<List<EcodeModel>> getEcodeHalal({required String input}) async {
    EcodeService ecodeService = EcodeService();
    List<EcodeModel> ingrident = await ecodeService.fetchAllEcodeData("");
    //set list of kode
    List<String> kodes = [];
    for (var v in ingrident) {
      kodes.add(v.id);
    }
    //preprocessing seperate by space, line and break
    List<String> listInput = input.multiSplit([' ', '-', '\n']);
    Set<EcodeModel> outputList = {};
    //matching input and kode
    for (var v in listInput) {
      var cleanWord = v.toLowerCase().replaceAll(RegExp(r'[^\w\s]+'), '');
      for (var kode in kodes) {
        if (kode.toLowerCase() == cleanWord) {
          EcodeModel output =
              ingrident.firstWhere((element) => element.id == kode);
          outputList.add(output);
        }
      }
    }
    return outputList.toList();
  }
}

extension UtilExtensions on String {
  List<String> multiSplit(Iterable<String> delimeters) => delimeters.isEmpty
      ? [this]
      : split(RegExp(delimeters.map(RegExp.escape).join('|')));
}
