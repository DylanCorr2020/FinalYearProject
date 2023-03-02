import 'package:flutter/material.dart';
import 'package:myfoodapp/cons/asset_paths.dart';
import 'package:myfoodapp/models/cart_item.dart';
import 'package:myfoodapp/screens/home/widgets/cart_item_widget.dart';
import 'package:myfoodapp/widgets/custom_btn.dart';
import 'package:myfoodapp/widgets/custom_text.dart';

//This widget displays the cart item using the CartItemModel and CartItemWidget
class ShoppingCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                text: "Shopping Cart",
                color: Colors.grey,
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: <CartItemModel>[
                CartItemModel(
                    // added to fix error
                    id: "",
                    name: "Magherita",
                    image: image1,
                    cost: "12",
                    quantity: "7")
              ]
                  .map((cartItem) => CartItemWidget(
                        cartItem: cartItem,
                      ))
                  .toList(),
            ),
          ],
        ),
        Positioned(
            bottom: 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              child: CustomButton(text: "Pay (\$${123.0})", onTap: () {}),
            ))
      ],
    );
  }
}
