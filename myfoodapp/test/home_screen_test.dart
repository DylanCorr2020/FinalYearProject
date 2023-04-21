import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/screens/home/home.dart';


void main() {
  testWidgets('Clicking chat icon opens chatbot screen',
      (WidgetTester tester) async {

        
    // Build the widget tree
    await tester.pumpWidget(GetMaterialApp(home: HomeScreen()));

    // Tap the chat icon
    await tester.tap(find.byIcon(Icons.chat));
    await tester.pumpAndSettle();

    // Check if the chatbot screen is opened
    expect(find.text('ChatBot'), findsOneWidget);
  });
}
