import 'dart:convert';

import 'package:get/get.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/product_.dart';
import 'package:halalin/app/data/services/product_services_.dart';
import 'package:halalin/app/data/services/service_preferences.dart';

class BookmarkController extends GetxController {
  RxList<Product> bookmarks = RxList();

  RxList<Product> products = RxList();
  final RxList<Product> _tempProduct = RxList();


  @override
  void onInit() {
    getProduct();
    getDataBookmarkProduct();
    super.onInit();
  }

  Future<void> getProduct() async {
    var resSavedProd = ProductServices.getDataBookmarkProduct();
    // resSavedProd.forEach((element) {
    //   print('${element.nama} ${element.is_bookmark}');
    // });
    if (resSavedProd.isEmpty) {
      var res = await ProductServices.getDataProduct();
      resSavedProd.addAll(res);
    }

    products.clear();
    products.addAll(resSavedProd);
    _tempProduct.clear();
    _tempProduct.addAll(resSavedProd);

    // resSavedProd.forEach((element) {
    //   print('${element.nama} ${element.is_bookmark}');
    // });
  }

  void getDataBookmarkProduct() {
    var res = ProductServices.getDataBookmarkProduct();
    bookmarks.clear();
    bookmarks.addAll(res);
  }

  void updateSaveDataBookmarkProduct() {
    bookmarks.refresh();

    // products.forEach((element) {
    //   print('${element.nama} ${element.is_bookmark}');
    // });
    ProductServices.savedDataBookmarkProduct(produks: bookmarks);
  }
}
