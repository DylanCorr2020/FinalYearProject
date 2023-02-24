import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// Initialize the Firebase app and get a future that resolves to a FirebaseApp instance
final Future<FirebaseApp> initialization = Firebase.initializeApp();

// Create an instance of the Firestore class using the FirebaseFirestore getter provided by the firebase_firestore package
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// Create an instance of the FirebaseAuth class using the FirebaseAuth getter provided by the firebase_auth package
FirebaseAuth auth = FirebaseAuth.instance;
