import 'package:flutter/material.dart';
import 'package:myfoodapp/cons/asset_paths.dart';
import 'package:myfoodapp/models/product.dart';
import 'package:myfoodapp/screens/home/widgets/single_product.dart';
import 'package:get/get.dart';
import '../../../cons/controllers.dart';

//this widget displays a list products with images loaded locally form disk
class ProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .63,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: productsController.products.map((ProductModel product) {
          return SingleProductWidget(product: product);
        }).toList()));
  }
}
