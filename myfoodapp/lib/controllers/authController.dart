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
  Rx<UserModel> userModel = UserModel(
      id: "user_id",
      name: "user_name",
      email: "user_email",
      phonenumber: "user_phoneNumber",
      cart: []).obs;

// This code overrides the onReady() method of the GetxController class. 
// This method is called when the state of the controller is ready.
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever<User?>(firebaseUser, _setMainScreen as dynamic);
  }

//This method validates user input and registers a new user with Firebase Authentication.
//It creates a new user with an email and password, adds user data to Firestore,
//and initializes the user model.
  void register() async {
    if (name.text.trim().isEmpty ||
        email.text.trim().isEmpty ||
        password.text.trim().isEmpty ||
        phoneNumber.text.trim().isEmpty) {
      Get.snackbar(
        "Register Failed",
        "Please fill in all the fields",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        messageText: Text(
          "Please fill in all the fields",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
      return;
    }
    if (!GetUtils.isEmail(email.text.trim())) {
      Get.snackbar(
        "Register Failed",
        "Please enter a valid email",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        messageText: Text(
          "Please enter a valid email",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
      return;
    }
    if (password.text.trim().length < 6) {
      Get.snackbar(
        "Register Failed",
        "Password must be at least 6 characters long",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        messageText: Text(
          "Password must be at least 6 characters long",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
      return;
    }
    if (!GetUtils.isPhoneNumber(phoneNumber.text.trim())) {
      Get.snackbar(
        "Registration Failed",
        "Please enter a valid phone number",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        messageText: Text(
          "Please enter a valid phone number",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
      return;
    }

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
      Get.snackbar(
        "Log In Failed",
        "User Already Exists",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        messageText: Text(
          "User Already Exists",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
    }
  }

//This method validates user input and logs in a user with Firebase Authentication using email
//and password.
  void logIn() async {
    if (email.text.trim().isEmpty || password.text.trim().isEmpty) {
      Get.snackbar(
        "Log In Failed",
        "Please enter a valid email",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        messageText: Text(
          "Please enter a valid email",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
      return;
    }
    if (!GetUtils.isEmail(email.text.trim())) {
      Get.snackbar(
        "Log In Failed",
        "Please enter a valid email",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        messageText: Text(
          "Please enter a valid email",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
      return;
    }
    if (password.text.trim().length < 6) {
      Get.snackbar(
        "Log In Failed",
        "Password must be at least 6 characters long",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        messageText: Text(
          "Password must be at least 6 characters long",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
      return;
    }
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
      Get.snackbar(
        "Log In Failed",
        "User does not exist",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        messageText: Text(
          "User does not exist",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
    }
  }

// This method logs out the current user.
  void logOut() async {
    auth.signOut();
  }

//This method adds user data to Firestore.
  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
      "phoneNumber": phoneNumber.text.trim(),
      "cart": []
    });
  }

//This method initializes the user model by fetching the user's data from Firestore.
  _initializeUserModel(String userId) async {
    userModel.value = await firebaseFirestore
        .collection(usersCollection)
        .doc(userId)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
  }

//This method sets the main screen based on the user's authentication state.
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

//This method sends a password reset email to the user's email address.
  void resetpassword(String email) async {
    await auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(AuthenticationScreen());
      Get.snackbar(
        "Password Reset email link is been sent",
        "Success",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        messageText: Text(
          "Password Reset email link has been sent",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
    }).catchError((onError) => Get.snackbar(
          "Error In Email Reset",
          "Failed",
          backgroundColor: Colors.black,
          colorText: Colors.white,
          messageText: Text(
            "Error In Email Reset",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  //This method listens to changes in the user's data in Firestore.
  // This method fires when changes occur in the firestore database
  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value?.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));
//This method clears the text controllers for the name, email, and password fields.
  _cleanControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}
