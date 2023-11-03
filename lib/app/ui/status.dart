import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/data/models/ecode.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/routes/app_pages.dart';

List<Widget> label({required Ingredient ingred}) {
  List<Widget> label = [];
  var statuses = ingred.status.map((v) {
    var color;
    if (v.toLowerCase() == 'halal') {
      color = Colors.green;
    } else if (v.toLowerCase() == 'doubfull') {
      color = Colors.amber;
    } else {
      color = Colors.redAccent;
    }
    return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(v),
          ),
        ));
  }).toList();
  label.addAll(statuses);
  Widget expand = Expanded(
    child: Container(),
  );
  Widget more = TextButton(
      onPressed: () async {
        await Get.toNamed(Routes.DETAIL_RESULT, arguments: ingred);
      },
      child: Text(
        'More ..',
        style: TextStyle(color: primary, fontSize: 12),
      ));
  label.add(expand);
  label.add(more);

  return label;
}

List<Widget> labelDetail({required Ingredient ingred}) {
  List<Widget> label = [];
  var statuses = ingred.status.map((v) {
    var color;
    if (v.toLowerCase() == 'halal') {
      color = Colors.green;
    } else if (v.toLowerCase() == 'doubfull') {
      color = Colors.amber;
    } else {
      color = Colors.redAccent;
    }
    return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(v),
          ),
        ));
  }).toList();
  label.addAll(statuses);
  Widget expand = Expanded(
    child: Container(),
  );
  label.add(expand);

  return label;
}

