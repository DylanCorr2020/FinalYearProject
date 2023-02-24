import 'package:flutter/material.dart';
import 'package:myfoodapp/cons/asset_paths.dart';

//The StartUpScreen class is a stateless widget that displays an image in the center of the screen.
class StartUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            logo,
            width: 400,
          ),
          SizedBox(
            height: 10,
          ),
          
        ],
      ),
    );
  }
}
