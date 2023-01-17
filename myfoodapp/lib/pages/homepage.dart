import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfoodapp/trolley.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final mealsCollection = FirebaseFirestore.instance.collection('meals');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Menu'),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.deepOrangeAccent,
              child: Text('Sign out'),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: mealsCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          if (snapshot.data == null) {
            return Text('No data');
          }

          final meals = snapshot.data!.docs;

          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              final image = meal['image'];
              final name = meal['name'];
              final description = meal['description'];
              final price = meal['Price'];

              return Container(
                margin: new EdgeInsets.all(20.0),
                height: 300,
                width: 300,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(image,
                            width: 400, height: 200, fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text(name),
                        subtitle: Text(description),
                        trailing: Text('Price: \$$price'),
                      ),
                      
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
