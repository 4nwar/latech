import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/product_.dart';
import 'package:halalin/app/data/services/service_preferences.dart';

class ProductServices {
  static Future<List<Product>> getDataProduct() async {
    var load = await rootBundle.loadString('assets/dataset/data_products.json');
    var data = json.decode(load);
    List<Product> ingredients =
        (data['data'] as List).map((v) => Product.fromJson(v)).toList();
    return ingredients;
  }

  static List<Product> getDataBookmarkProduct() {
    var res = PreferencesService.pref.getStringList(BOOKMARK_KEY);
    List<Product> data = [];
    if (res != null) {
      List<Product> dt =
          res.map((e) => Product.fromJson(json.decode(e))).toList();
      data.addAll(dt);
    } else {
      data = [];
    }
    return data;
  }

  static void savedDataBookmarkProduct({required List<Product> produks}) {
    PreferencesService.pref.remove(BOOKMARK_KEY);
    List<String> listString =
        produks.map((e) => json.encode(e.toMap())).toList();
    PreferencesService.pref.remove(BOOKMARK_KEY);
    PreferencesService.pref.setStringList(BOOKMARK_KEY, listString);
  }
}
