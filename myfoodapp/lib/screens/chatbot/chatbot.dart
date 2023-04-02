
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/screens/chatbot/messages.dart';

import '../../controllers/chatBotController.dart';


class ChatBot extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Takeaway Bot'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<ChatController>(
                builder: (controller) =>
                    MessagesScreen(messages: controller.messages),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Colors.green,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: chatController.textController,
                      style: TextStyle(color: Colors.white),
                       decoration: InputDecoration(
                      hintText: 'Type a message...',
                     hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                      
                    ),
                  )),
                  IconButton(
                    onPressed: () {
                      chatController
                          .sendMessage(chatController.textController.text);
                      chatController.textController.clear();
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
