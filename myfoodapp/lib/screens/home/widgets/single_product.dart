import 'package:flutter/material.dart';
import 'package:myfoodapp/models/product.dart';
import 'package:myfoodapp/widgets/custom_text.dart';

//Displays the details of a single product
class SingleProductWidget extends StatelessWidget {
  final ProductModel product;

  const SingleProductWidget({Key? key, required this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  product.image,
                  width: double.infinity,
                )),
          ),
          CustomText(
            text: product.name,
            size: 18,
            // added this to fix an error
            color: Colors.grey,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: product.brand,
            // added this to fix null error
            size: 18,
            weight: FontWeight.bold,
            color: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: "\$${product.price}",
                  size: 22,
                  // added this to fix error
                  color: Colors.grey,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }
}
