import 'package:flutter/material.dart';
import 'package:myfoodapp/cons/asset_paths.dart';

//This class displays the start up screen for the application
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
            width: 500,
            height: 500,
          ),
          SizedBox(
            height: 0.5,
          ),
        ],
      ),
    );
  }
}
