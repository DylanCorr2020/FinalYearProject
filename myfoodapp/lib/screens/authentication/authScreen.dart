import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/cons/asset_paths.dart';
import 'package:myfoodapp/controllers/appController.dart';
import 'package:myfoodapp/screens/authentication/widgets/bottomTextWidget.dart';
import 'package:myfoodapp/screens/authentication/widgets/loginWidget.dart';
import 'package:myfoodapp/screens/authentication/widgets/regWidget.dart';

//This widget displays a login or registration screen depending on the
//value of _appController.isLoginScreenDisplayed.
//The Obx widget is used to update the UI when the auth status changes.
class AuthenticationScreen extends StatelessWidget {
  final AppController _appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.width / 3),
                Image.asset(
                  logo,
                  width: 200,
                ),
                SizedBox(height: MediaQuery.of(context).size.width / 5),
                Visibility(
                    visible: _appController.isLoginScreenDisplayed.value,
                    child: LoginWidget()),
                Visibility(
                    visible: !_appController.isLoginScreenDisplayed.value,
                    child: RegWidget()),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: _appController.isLoginScreenDisplayed.value,
                  child: BottomTextWidget(
                    key: UniqueKey(), // provide a unique key for the widget
                    onTap: () {
                      _appController.changeDIsplayedAuthWidget();
                    },
                    text1: "Don\'t have an account?",
                    text2: "Create account!",
                  ),
                ),
                Visibility(
                  visible: !_appController.isLoginScreenDisplayed.value,
                  child: BottomTextWidget(
                    key: UniqueKey(), // provide a unique key for the widget
                    onTap: () {
                      _appController.changeDIsplayedAuthWidget();
                    },
                    text1: "Already have an account?",
                    text2: "Sign in!!",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
