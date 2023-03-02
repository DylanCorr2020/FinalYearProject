import 'package:flutter/material.dart';
import 'package:myfoodapp/cons/asset_paths.dart';
import 'package:myfoodapp/models/product.dart';
import 'package:myfoodapp/screens/home/widgets/single_product.dart';

//this widget displays a list products with images loaded locally form disk
class ProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .63,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: <ProductModel>[
          ProductModel(
              id: "",
              name: "Margherita",
              brand: "Pizza",
              price: "12.0",
              image: image1),
          ProductModel(
              id: "",
              name: "Pepperoni",
              brand: "Pizza",
              price: "12.0",
              image: image2),
          ProductModel(
              id: "",
              name: "Kamals",
              brand: "Special",
              price: "12.0",
              image: image3),
          ProductModel(
              id: "",
              name: "Pesto",
              brand: "Pizza",
              price: "12.0",
              image: image4),
          ProductModel(
              id: "",
              name: "Vegetable",
              brand: "Pizza",
              price: "12.0",
              image: image5),
          ProductModel(
              id: "",
              name: "Ceasar Lover",
              brand: "Pizza",
              price: "12.0",
              image: image6),
        ].map((ProductModel product) {
          return SingleProductWidget(
              key: ValueKey(product.id), product: product);
        }).toList());
  }
}
