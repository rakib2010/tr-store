import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/controllers/cart_controller.dart';
import 'package:tr_store/utils/shimer_loading.dart';
import 'package:tr_store/widgets/cart_icon.dart';




class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product Details'),
        actions: [Center(child: CartIcon())],
      ),
      body: product == null
          ? ShimmerLoading() // Display shimmer loading while fetching data
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['title'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Description: ${product['body']}'),
                  SizedBox(height: 8),
                  Text('Price: \$${product['userId']}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final cartController = Get.find<CartController>();
                      cartController.addToCart(product);
                      Get.snackbar('Added to Cart', 'Item added successfully!');
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
    );
  }
}