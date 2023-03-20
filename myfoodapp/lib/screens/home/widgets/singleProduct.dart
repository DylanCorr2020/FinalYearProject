import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/controllers/cartcontroller.dart';
import 'package:myfoodapp/models/product.dart';
import 'package:myfoodapp/screens/home/widgets/productDescription.dart';
import 'package:myfoodapp/widgets/custom_text.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;

  const SingleProductWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController =
        CartController(); // Initialize the CartController

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.to(() => ProductDescription(product: product));
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Ink.image(
                        image: NetworkImage(product.image),
                        width: 160,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Click image for more information',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: product.name,
                    size: 20,
                    color: Colors.black,
                    weight: FontWeight.bold,
                  ),
                  CustomText(
                    text: product.category,
                    size: 20,
                    color: Colors.black,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "\€${product.price}",
                        size: 20,
                        color: Colors.black,
                        weight: FontWeight.bold,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          cartController.addProductToCart(product);
                        },
                        child: Text('Add to Cart'),
                      ),
                    ],
                  ), //row
                ],
              ), // column
            ), // expanded
            SizedBox(width: 8),
          ],
        ), //row
      ), //sized box
    ); //card
  }
}
