import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/cons/firebase.dart';
import 'package:myfoodapp/models/user.dart';
import 'package:myfoodapp/screens/authentication/authScreen.dart';
import 'package:myfoodapp/screens/home/home.dart';

//This class contains functions for registering, logging in, and logging out users using Firebase Authentication.
//It manages user authentication and related data.
class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  String usersCollection = "users";
  Rx<UserModel> userModel =
      UserModel(id: "user_id", name: "user_name", email: "user_email").obs;
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever<User?>(firebaseUser, _setMainScreen as dynamic);
  }

  void register() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _addUserToFirestore(_userId);
        _initializeUserModel(_userId!);
        _cleanControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Log In Failed", "Try again");
    }
  }

  void logIn() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _initializeUserModel(_userId);
        _cleanControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Log In Failed", "Try again");
    }
  }

  void logOut() async {
    auth.signOut();
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set(
        {"name": name.text.trim(), "id": userId, "email": email.text.trim()});
  }

  _initializeUserModel(String userId) async {
    userModel.value = await firebaseFirestore
        .collection(usersCollection)
        .doc(userId)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
  }

  _setMainScreen(User? user) {
    if (user == null) {
      Get.offAll(() => AuthenticationScreen());
    } else {
      _initializeUserModel(user.uid);
      Get.offAll(() => HomeScreen());
    }
  }

  _cleanControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}
