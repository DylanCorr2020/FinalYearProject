import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:myfoodapp/navigationbar.dart';
import 'package:myfoodapp/pages/authpage.dart';
import 'package:myfoodapp/pages/homepage.dart';
import 'package:myfoodapp/pages/loginpage.dart';

//this widget will be used to see of we are logged in or not 


class MainPage extends StatelessWidget {
  const MainPage({super.key});
  
  //stream builder check non null user
  //stream -> FireBaseAuth.instance
  //listen to any auth state changes
  //context gives us the information of the user 
  //if snapshot has data return our homepage else return log in page
  //checking for any auth state changes 
  //auth stage will happen when we try to log in 
  //if we sign in and the database has data of that user in DB
  //then return homepage else return login page 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
              return Navbar();
          }
          else{
              return AuthPage();
          }
        }
      ),

    );
  }
}