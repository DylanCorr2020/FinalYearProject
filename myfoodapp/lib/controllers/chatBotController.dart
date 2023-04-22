//import 'package:chatbot/messages.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This class defines a ChatController class which is a GetX controller responsible for
// managing a chat interface.
// The ChatController is a singleton class, meaning only one instance can be
// created throughout the app. It initializes a DialogFlowtter instance on initialization,
// which is used to communicate with the Dialogflow chatbot backend.
class ChatController extends GetxController {
  static ChatController instance = Get.find();
  late DialogFlowtter dialogFlowtter;
  final TextEditingController textController = TextEditingController();
  final RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.onInit();
  }

  //The sendMessage method is responsible for sending a message to the chatbot.
  //It first checks if the message is empty and if not, adds the message to the
  //list of messages and sends a request to Dialogflow using the DialogFlowtter instance.
  //It then adds the response from Dialogflow to the list of messages as well.
  void sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      addMessage(Message(text: DialogText(text: [text])), true);

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;

      addMessage(response.message!);
    }
  }

  //The addMessage method is responsible for adding a message to the list of messages. 
  //It takes a message and a boolean flag indicating whether the message is from the user or not. 
  //The method then adds the message and its flag as a map to the list of messages.
  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
