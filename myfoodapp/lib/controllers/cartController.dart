import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/models/product.dart';
import 'package:myfoodapp/cons/controllers.dart';
import 'package:myfoodapp/models/cart_item.dart';
import 'package:myfoodapp/cons/app_constants.dart';
import 'package:myfoodapp/models/user.dart';
//This class is the controller for the shopping cart
class CartController extends GetxController {
  static CartController instance = Get.find();
  Rx<double> cartTotalPrice = Rx<double>(0.0);
  @override
  void onReady() {
    super.onReady();
    ever(authController.userModel, updateCartTotalPrice);
  }
  //add product to cart
  void addProductToCart(ProductModel product) {
    try {
      if (_itemAlreadyAdded(product)) {
       Get.snackbar(
          "Warning",
          "${product.name} is already added to your shopping cart",
          backgroundColor: Colors.black,
          colorText: Colors.white,
          messageText: Text(
            "${product.name} is already added to your shopping cart",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        );
      } else {
        String itemId = Uuid().toString();
        authController.updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.name,
              "quantity": 1,
              "price": product.price,
              "image": product.image,
              "cost": product.price
            }
          ])
        });
        Get.snackbar(
            "Success", "${product.name} was added to your shopping cart",
             backgroundColor: Colors.black,
          colorText: Colors.white,
            messageText: Text(
            "${product.name} was added to your shopping cart",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
            );
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      debugPrint(e.toString());
    }
  }

  //remove product from  cart
  void removeItemFromCart(CartItemModel cartItem) {
    try {
      authController.updateUserData({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
      debugPrint(e.toString());
    }
  }

  //update cart total price
  updateCartTotalPrice(UserModel userModel) {
    cartTotalPrice.value = 0.0;
    if (userModel.cart.isNotEmpty) {
      userModel.cart.forEach((cartItem) {
        cartTotalPrice += cartItem.cost;
      });
    }
  }
//This method checks if a given ProductModel object is already present in the user's cart and 
//returns a boolean value.
  bool _itemAlreadyAdded(ProductModel product) =>
      authController.userModel.value.cart
          .where((item) => item.productId == product.id)
          .isNotEmpty;
  //reduce quantity
  void reduceQty(CartItemModel item) {
    if (item.quantity == 1) {
      removeItemFromCart(item);
    } else {
      removeItemFromCart(item);
      item.quantity--;
      authController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }
  //increase quantity
  void increaseQty(CartItemModel item) {
    removeItemFromCart(item);
    item.quantity++;
    authController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }
}
