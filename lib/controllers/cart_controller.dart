import 'package:get/get.dart';
import 'package:tr_store/data/database_helper.dart';



class CartController extends GetxController {
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchCartItems();
    super.onInit();
  }

  void fetchCartItems() async {
    try {
      final db = await DBHelper.initializeDatabase();
      final items = await db.query('cart');
      cartItems.assignAll(items);
    } catch (e) {
      print('Error fetching cart items: $e');
    }
  }

  void addToCart(Map<String, dynamic> product) async {
    try {
      final db = await DBHelper.initializeDatabase();
      await db.insert('cart', {
        'productId': product['id'],
        'quantity': 1,
      });
      fetchCartItems();
    } catch (e) {
      print('Error adding to cart: $e');
    }
  }
}