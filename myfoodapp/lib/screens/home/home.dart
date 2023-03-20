import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:myfoodapp/cons/controllers.dart';
import 'package:myfoodapp/screens/home/widgets/products.dart';
import 'package:myfoodapp/screens/home/widgets/shoppingCart.dart';
import 'package:myfoodapp/widgets/custom_text.dart';


//This widget displays the app bar, products , sidebar to sign out , displays user's name
//and the shopping cart icon
class HomeScreen extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          
          title: Obx(() => DropdownButton(
                value: productsController.selectedCategory.value,
                items: productsController.categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (selectedCategory) {
                   productsController.selectedCategory.value = selectedCategory!;
                  productsController.getProductsByCategory(
                      productsController.selectedCategory);
                },
              )),
          
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: Colors.white,
                      child: ShoppingCartWidget(),
                    ),
                  );
                })
          ],
          elevation: 0,
          centerTitle: true,
          
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: [
              Obx(() => UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  accountName: Text(authController.userModel.value.name ?? ""),
                  accountEmail:Text(authController.userModel.value.email ?? ""))),
                  
                  
              ListTile(
                onTap: () {
                  authController.logOut();
                },
                leading: Icon(Icons.exit_to_app),
                title: Text("Log out"),
              )
            ],
          ),
        ),
        body: Container(
          color: Colors.white30,
          child: ProductsWidget(),
        ));
  }
}
