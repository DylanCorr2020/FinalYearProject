import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// A GetX controller that manages the state of the app
class AppController extends GetxController {
  // GetX instance of the AppController class
  static AppController instance = Get.find();

  // A method that toggles the value of the `isLoginScreenDisplayed` observable
  changeDIsplayedAuthWidget() {
    isLoginScreenDisplayed.value = !isLoginScreenDisplayed.value;
  }

  // An observable boolean value that tracks whether the login screen is displayed
  RxBool isLoginScreenDisplayed = true.obs;
}
