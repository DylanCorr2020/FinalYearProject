import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/cons/controllers.dart';
import 'package:myfoodapp/screens/authentication/authScreen.dart';
import 'package:myfoodapp/widgets/app_button.dart';
import 'package:myfoodapp/widgets/custom_btn.dart';

// This widget displays a login form with an email input, a password input, and a login button.
// When the login button is tapped, it calls the logIn method of the authController instance.

class ForgotPassword extends StatelessWidget {
 TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 10,
              )
            ],
            borderRadius: BorderRadius.circular(20),
          
            
          ),
          
          child: Material(

            child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(
                    "Please enter your email address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                       const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                          borderSide: BorderSide.none,),
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: AppButtons(
                      text: "Send Link",
                      widthSize: 400,
                      heightSize: 50,
                      textcolor: Colors.white,
                      backgroundColor: Colors.green,
                      borderColor: Colors.black,
                      onTap: () {
                        //authController.logIn();
                        //Get.to(AuthenticationScreen());
                         authController.resetpassword(email.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
