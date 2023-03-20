import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/cons/asset_paths.dart';
import 'package:myfoodapp/models/cart_item.dart';
import 'package:myfoodapp/screens/home/widgets/cartitemwidget.dart';
import 'package:myfoodapp/widgets/app_button.dart';
import 'package:myfoodapp/widgets/custom_btn.dart';
import 'package:myfoodapp/widgets/custom_text.dart';

import '../../../cons/controllers.dart';

//This widget displays the cart item using the CartItemModel and CartItemWidget
class ShoppingCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                CustomText(
                  text: "Shopping Cart",
                  size: 24,
                  color: Colors.white,
                  weight: FontWeight.bold,
                ),
                SizedBox(width: 24),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: authController.userModel.value.cart.length,
                  itemBuilder: (context, index) {
                    CartItemModel cartItem =
                        authController.userModel.value.cart[index];
                    return CartItemWidget(
                      cartItem: cartItem,
                    );
                  },
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Subtotal",
                      weight: FontWeight.bold,
                      size: 16,
                      color: Colors.black,
                    ),

                    Obx(
                      () => CustomText(
                        text:
                            "\€${cartController.cartTotalPrice.value.toStringAsFixed(2)}",
                        size: 16,
                        color: Colors.black,
                        weight: FontWeight.bold,
                      ), // end custom text
                    ) // end obx
                  ],
                ),
                SizedBox(height: 16),
                Obx(() => AppButtons(
                    text:
                        "Pay (\€${cartController.cartTotalPrice.value.toStringAsFixed(2)})",
                    widthSize: 400,
                    heightSize: 50,
                    textcolor: Colors.white,
                    backgroundColor: Colors.green,
                    borderColor: Colors.black,
                    onTap: () {})) // end obx // end appButtons
              ],
            ),
          ),
        ],
      ),
    );
  }
}
