import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/cons/controllers.dart';
import 'package:myfoodapp/screens/authentication/widgets/forgotPassword.dart';
import 'package:myfoodapp/widgets/app_button.dart';
import 'package:myfoodapp/widgets/custom_btn.dart';

//This widget displays a login form with an email input, a password input, and a login button.
//When the login button is tapped, it calls the logIn method of the authController instance.
class LoginWidget extends StatelessWidget {

late String emailErrorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.withOpacity(.3),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    controller: authController.email,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email_outlined),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Email"
                        ),
                     ),
                  
                ),
                
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.withOpacity(.3),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    obscureText: true,
                    controller: authController.password,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Password"),
                      
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 20),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.to(ForgotPassword());
            },
            child: Text(
              "                                  Forgot Password ?",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: AppButtons(
                text: "Login",
                widthSize: 400,
                heightSize: 50,
                textcolor: Colors.white,
                backgroundColor: Colors.green,
                borderColor: Colors.black,
                onTap: () {
                  authController.logIn();
                }),
          ),
        ],
      ),
    );
  }
}
