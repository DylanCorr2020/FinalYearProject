import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/cons/controllers.dart';
import 'package:myfoodapp/widgets/custom_btn.dart';
import '../../../widgets/app_button.dart';

//This widget displays a registration form with a name input, email input, a password input, and a register button.
//When the register button is tapped, it calls the regsiter method of the authController instance.
class RegWidget extends StatelessWidget {
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
                    controller: authController.name,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Name"),
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
                    controller: authController.email,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email_outlined),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Email"),
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
                  child: Row(
                    children: [
                      Icon(Icons.phone, size: 20),
                      SizedBox(width: 10),
                      Text(
                        "+353", 
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: authController.phoneNumber,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: "Phone Number"),
                        ),
                      ),
                    ],
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
         
          Padding(
            padding: const EdgeInsets.all(25),
            child: AppButtons(
                text: "Register",
                widthSize: 400,
                heightSize: 50,
                textcolor: Colors.white,
                backgroundColor: Colors.green,
                borderColor: Colors.black,
                onTap: () {
                  authController.register();
                }),
          ),
        ],
      ),
    );
  }
}
