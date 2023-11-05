import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:halalin/app/data/models/ingredient.dart';

class HalalServices {
  // HalalServices();
  // static final HalalServices _instance = HalalServices._internal();
  // static HalalServices get instance => _instance;
  // HalalServices._internal();

  //batas---

  // get dataset
  static Future<List<Ingredient>> getDataService() async {
    var load = await rootBundle.loadString('assets/dataset/dataset\.json');
    var data = json.decode(load);
    List<Ingredient> ingredients =
        (data['data'] as List).map((v) => Ingredient.fromJson(v)).toList();
    return ingredients;
  }

  // get result data
  static Future<List<Ingredient>> getHalal({required String input}) async {
    List<Ingredient> ingrident = await getDataService();
    //set list of kode
    List<String> kodes = [];
    for (var v in ingrident) {
      kodes.add(v.kode);
    }
    //preprocessing seperate by space, line and break
    List<String> listInput = input.multiSplit([' ', '-', '\n']);
    Set<Ingredient> outputList = {};
    //matching input and kode
    for (var v in listInput) {
      var cleanWord = v.toLowerCase().replaceAll(RegExp(r'[^\w\s]+'), '');
      for (var kode in kodes) {
        if (kode.toLowerCase() == cleanWord) {
          Ingredient output =
              ingrident.firstWhere((element) => element.kode == kode);
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
