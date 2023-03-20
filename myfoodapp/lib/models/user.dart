import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfoodapp/models/cart_item.dart';

// User class model
class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PHONENUMBER = "phoneNumber";
  static const CART = "cart";

  late String id;
  late String name;
  late String email;
  late String phonenumber;
  late List<CartItemModel> cart; // List of cartItemModels

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phonenumber,
      required this.cart});

  //before change
  // UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
  //   final data = snapshot.data()!;
  //   name = data[NAME]!;
  //   email = data[EMAIL]!;
  //   id = data[ID]!;
  //   cart = _loadCartItemsFromMap(data[CART] ?? []);
  // }
  // Took this from original
  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    name = data[NAME];
    email = data[EMAIL];
    phonenumber = data[PHONENUMBER];
    id = data[ID];
    cart = _convertCartItems(data[CART] ?? []);
  }

  List<CartItemModel> _convertCartItems(List cartFromDb) {
    List<CartItemModel> _result = [];
    if (cartFromDb.length > 0) {
      cartFromDb.forEach((element) {
        _result.add(CartItemModel.fromMap(element));
      });
    }
    return _result;
  }

  List cartItemsToJson() => cart.map((item) => item.toJson()).toList();
}

