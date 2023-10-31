import 'dart:convert';

import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/product_.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static late SharedPreferences pref;

  static init() async => pref = await SharedPreferences.getInstance();
}
