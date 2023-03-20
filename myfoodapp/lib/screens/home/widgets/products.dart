import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/cons/asset_paths.dart';
import 'package:myfoodapp/cons/controllers.dart';
import 'package:myfoodapp/models/product.dart';
import 'package:myfoodapp/screens/home/widgets/singleProduct.dart';

//this widget displays a list products with images loaded locally form disk
class ProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectedCategory = productsController.selectedCategory.value;
      final filteredProducts = productsController.products
          .where((product) => product.category == selectedCategory)
          .toList();
      return ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (BuildContext context, int index) {
          final product = filteredProducts[index];
          return SingleProductWidget(product: product);
        },
      );
    });
  }
}
