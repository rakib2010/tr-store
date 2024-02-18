import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/controllers/cart_controller.dart';
import 'package:tr_store/pages/product_details_page.dart';
import 'package:tr_store/pages/product_page.dart';
import 'package:tr_store/pages/shopping_cart_page.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TR Store',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/products',
      getPages: [
        GetPage(name: '/products', page: () => ProductPage()),
        GetPage(name: '/product_details', page: () => ProductDetailsPage()),
        GetPage(name: '/cart', page: () => ShoppingCartPage()),
      ],
    );
  }
}