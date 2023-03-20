import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/cons/firebase.dart';
import 'package:myfoodapp/models/user.dart';
import 'package:myfoodapp/screens/authentication/authScreen.dart';
import 'package:myfoodapp/screens/home/home.dart';

import '../cons/app_constants.dart';

//This class contains functions for registering, logging in, and logging out users using Firebase Authentication.
//It manages user authentication and related data.
class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  String usersCollection = "users";
  Rx<UserModel> userModel =
      UserModel(id: "user_id", name: "user_name", email: "user_email", phonenumber: "user_phoneNumber", cart: [])
          .obs;
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever<User?>(firebaseUser, _setMainScreen as dynamic);
  }

  //validation
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password should be at least 6 characters';
    }
    return null;
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
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
      "phoneNumber": phoneNumber.text.trim(), 
      "cart": []
    });
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
      userModel.bindStream(listenToUser());
      _initializeUserModel(user.uid);
      Get.offAll(() => HomeScreen());
    }
  }

  // This code updates the Firestore database with item added
// to the cart
  updateUserData(Map<String, dynamic> data) {
    //logger.i("logger - start updateUserData");
    try {
      firebaseFirestore
          .collection(usersCollection)
          .doc(firebaseUser.value?.uid)
          .update(data);
    } catch (e) {
      logger.i("Error updating document: $e");
      throw e;
    }
    //logger.i("logger - exit updateUserData");
  }

  void resetpassword(String email) async {
    await auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(AuthenticationScreen());
      Get.snackbar("Password Reset email link is been sent", "Success");
    }).catchError((onError) => Get.snackbar("Error In Email Reset", "Failed"));
  }

  // This method fires when changes occur in the firestore database
  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value?.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));

  _cleanControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}
