import 'package:cloud_firestore/cloud_firestore.dart';

// User class model
class UserModel {
  // Defining constants for the user model properties
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";

  // Declaring variables for the user model properties
  late String id;
  late String name;
  late String email;

  // Constructor to initialize the user model properties
  UserModel({required this.id, required this.name, required this.email});

  // Constructor to create a user model object from a document snapshot
  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    name = data[NAME]!;
    email = data[EMAIL]!;
    id = data[ID]!;
  }
}
