import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/ui/status.dart';

import '../controllers/detail_result_controller.dart';

class DetailResultView extends GetView<DetailResultController> {
  const DetailResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Ingredient ingred = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset(resultCard),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(ingred.name, style: const TextStyle(fontSize: 20)),
                        Text(
                          ingred.kode,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: labelDetail(ingred: ingred)
                        ), // ubah cukup satau status jadi gak pake row
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'E-CODE',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              ingred.kode,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              ingred.name,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              ingred.tipe,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Desc',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              ingred.desc,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
