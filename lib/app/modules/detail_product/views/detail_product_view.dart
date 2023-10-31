import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halalin/app/data/models/product_.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          'Detail Product',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Image.network(product.gambar),
          Text(
            product.nama,
            style: TextStyle(fontSize: 24),
          ),
          Text(product.ingredient),
        ],
      ),
    );
  }
}
