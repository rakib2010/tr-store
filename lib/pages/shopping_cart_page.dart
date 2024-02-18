import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/controllers/cart_controller.dart';
import 'package:tr_store/widgets/cart_icon.dart';




class ShoppingCartPage extends StatelessWidget {
  final cartController = Get.put(CartController());





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shopping Cart'),
        actions: [Center(child: CartIcon())],
      ),
      body: Obx(
        () => cartController.cartItems.isEmpty
            ? Center(child: Text('Cart is empty'))
            : ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartController.cartItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
                    child: ListTile(
                      title: Text('Product ID: ${cartItem['productId']}'),
                      subtitle: Text('Quantity: ${cartItem['quantity']}'),
                    ),
                  );
                },
              ),
      ),
    );
  }
}