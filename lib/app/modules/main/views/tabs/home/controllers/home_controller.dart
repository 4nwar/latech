import 'package:get/get.dart';
import 'package:halalin/app/data/models/product_.dart';
import 'package:halalin/app/data/services/product_services_.dart';
import 'package:halalin/app/data/services/service_preferences.dart';

class HomeController extends GetxController {
  RxList<Product> products = RxList();
  final RxList<Product> _tempProduct = RxList();
  // final RxList<Product> savedProduct = RxList();

  @override
  void onInit() {
    getProduct();
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

  void searchProduct({required String query}) {
    if (query != '') {
      var res = _tempProduct
          .where(
              (v) => (v.nama.contains(query) || v.ingredient.contains(query)))
          .toList();
      products.clear();
      products.addAll(res);
    }
  }

  void updateSaveDataBookmarkProduct() {
    products.refresh();

    // products.forEach((element) {
    //   print('${element.nama} ${element.is_bookmark}');
    // });
    ProductServices.savedDataBookmarkProduct(produks: products);
  }

  // Future<void> setLabelBookmarkProduct() async {
  //   products.asMap().forEach((index, value) {
  //     if (savedProduct.contains(value)) {
  //       products[index].is_bookmark = true;
  //     } else {
  //       products[index].is_bookmark = false;
  //     }
  //     products.refresh();
  //   });
  // }
}
