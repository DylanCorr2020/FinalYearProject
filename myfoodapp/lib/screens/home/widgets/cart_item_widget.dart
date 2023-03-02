import 'package:flutter/material.dart';
import 'package:myfoodapp/models/cart_item.dart';
import 'package:myfoodapp/widgets/custom_text.dart';


//This is a widget called CartItemWidget that displays a single item in a shopping cart. 
//It takes a CartItemModel object as input, which contains 
//information about the item such as its name, image, quantity, and cost
class CartItemWidget extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            cartItem.image,
            width: 80,
          ),
        ),
        Expanded(
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Container(
                padding: EdgeInsets.only(left: 14),
                child: CustomText(
                  text: cartItem.name,
                  size: 16,
                  color: Colors.black, // add color parameter
                  weight: FontWeight.bold, // add weight parameter
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(Icons.chevron_left), onPressed: () {}),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: cartItem.quantity,
                      size: 12,
                      color: Colors.black, // add color parameter
                      weight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.chevron_right), onPressed: () {}),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: "\$${cartItem.cost}",
            size: 22,
            weight: FontWeight.bold,
            color: Colors.black, // add color parameter
          ),
        ),
      ],
    );
  }
}