import 'package:myfoodapp/controllers/appController.dart';
import 'package:myfoodapp/controllers/authController.dart';

import '../controllers/cartController.dart';
import '../controllers/productsController.dart';

/*
  This line of code creates an instance of the AppController class using 
  the instance getter provided by the Get package. The instance getter 
  ensures that only one instance of the AppController class is created and shared
   throughout the app, which makes it easy to manage the state of the app
*/
AppController appController = AppController.instance;
AuthController authController = AuthController.instance;
ProductsController productsController = ProductsController.instance;
CartController cartController = CartController.instance;
