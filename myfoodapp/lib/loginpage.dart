import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //create controllers for the two text fields
  //password and email
  //we need these to track what the user types into each field
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //create sign in method 
  //future used for async like promises
  //we asynchrously checking if we can sign in or not
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      //grab just the text trim helps format text
      email: emailController.text.trim(), 
      password: passwordController.text.trim(),
      );
  }
   
  //dispose of our controllers to help our memory management 
  //dispose of them when were not using it 
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        //fixes overflow problem wrap column in widget
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: NetworkImage('https://tinyurl.com/bdhm4kw6')),
              SizedBox(height: 20),
              Text('Pizza Dozzina',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  )),
              SizedBox(height: 10),
              Text('Welcome back! you have been missed',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              SizedBox(height: 10),

              //email

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //add in controller here
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your Email',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),


              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  //GestureDetector class for detecting common gestures
                  //tap on sign in button then execute sign In button
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: Text('Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ))),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                  Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
