import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/models/product.dart';
import 'package:myfoodapp/widgets/custom_text.dart';

class ProductDescription extends StatelessWidget {
  final ProductModel product;

  const ProductDescription({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: product.name,
          size: 20,
          color: Colors.white,
          weight: FontWeight.bold,
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Column(
                children: [
                  Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomText(
                      text: product.description,
                      size: 20,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}







