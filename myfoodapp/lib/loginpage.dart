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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
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
      )),
    );
  }
}
