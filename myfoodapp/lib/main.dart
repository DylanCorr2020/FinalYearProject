import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/cons/controllers.dart';
import 'package:myfoodapp/controllers/authController.dart';
import 'package:myfoodapp/controllers/cartController.dart';
import 'package:myfoodapp/screens/authentication/widgets/loginWidget.dart';
import 'cons/firebase.dart';
import 'controllers/appController.dart';
import 'package:myfoodapp/screens/startup/startupScreen.dart';
import 'controllers/paymentsController.dart';
import 'controllers/productsController.dart';

//This is the starting point for the application'
//It initializes the application and controllers using GetX
void main() async {
  // Ensure that widgets are initialized before the app runs
  WidgetsFlutterBinding.ensureInitialized();

  // Wait for the initialization to complete before starting the app
  await initialization.then((value) {
    // Register an instance of the AppController class
    Get.put(AppController());
    Get.put(AuthController());
    Get.put(ProductsController());
    Get.put(CartController());
    Get.put(PaymentsController());
  });

  // Run the MyApp widget
  runApp(MyApp());
}

// Define the MyApp widget
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // Return the GetMaterialApp widget, which configures the app's theme and initial screen
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartUpScreen(),
      //home: LoginWidget(),
    );
  }
}
