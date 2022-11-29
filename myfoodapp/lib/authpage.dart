import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myfoodapp/loginpage.dart';
import 'package:myfoodapp/registerpage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  
  
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  //initially show loginpage
  bool showLoginPage = true;
   

  void toggleScreens(){
     setState(() {
       showLoginPage = !showLoginPage;
     });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
         return LoginPage(showRegisterPage: toggleScreens);
    }
    else{
        return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}