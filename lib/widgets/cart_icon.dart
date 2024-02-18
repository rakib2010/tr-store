import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/controllers/cart_controller.dart';




class CartIcon extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/cart'),
      child: Stack(
        children: [
          Icon(Icons.shopping_cart),
          Positioned(
            right: 0,
            child: Obx(() => cartController.cartItems.length > 0
                ? CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      cartController.cartItems.length.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                : Container()),
          ),
        ],
      ),
    );
  }
}