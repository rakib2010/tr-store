import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/controllers/cart_controller.dart';
import 'package:tr_store/controllers/product_controller.dart';
import 'package:tr_store/utils/shimer_loading.dart';
import 'package:tr_store/widgets/cart_icon.dart';




class ProductPage extends StatelessWidget {
  final productController = Get.put(ProductController());




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
        
        actions: [Center(child: CartIcon())],
      ),
      body: Obx(
        () => productController.productList.isEmpty
            ? ShimmerLoading() 
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  final product = productController.productList[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
                    child: ListTile(
                      title: Text(product['title']),
                      subtitle: Text('Price: \$${product['userId']}'),
                      onTap: () {
                        Get.toNamed('/product_details', arguments: product);
                      },
                      trailing: IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          final CartController cartController = Get.find();
                          cartController.addToCart(product);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}