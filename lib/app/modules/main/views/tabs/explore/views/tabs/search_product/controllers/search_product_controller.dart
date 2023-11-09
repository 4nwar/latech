
import 'package:get/get.dart';
import 'package:halalin/app/data/models/product.dart';
import 'package:halalin/app/data/services/product_service.dart';

class SearchProductController extends GetxController {
  final count = 0.obs;

  final productService = ProductService();
  final productList = <ProductModel>[].obs;
  final isLoading = false.obs;

  Future<void> searchProducts(String productName) async {
    try {
      isLoading.value = true;
      final products = await productService.searchProducts(productName);
      productList.assignAll(products);
    } catch (error) {
      print(error);
    }finally{
      isLoading.value = false;
    }
  }
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}