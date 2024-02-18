import 'package:get/get.dart';
import 'package:tr_store/data/repository.dart';


class ProductController extends GetxController {
  RxList<Map<String, dynamic>> productList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      final products = await Repository.fetchProducts();
      productList.assignAll(products);
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}