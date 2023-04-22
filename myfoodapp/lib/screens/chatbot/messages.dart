import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/chatBotController.dart';
//This is a class that creates a widget for displaying a list of messages in the chat interface.
//The messages are stored in a list and passed to the widget as a parameter. 
//The widget uses the GetX package to update the UI when new messages are added. 
//It uses the Flutter ListView widget to display the messages and customizes the appearance 
//of each message based on whether it is a user message or a bot message. 
//The messages are formatted in a chat bubble style and displayed on the 
//left or right side of the screen depending on who sent the message.
class MessagesScreen extends StatelessWidget {
  final ChatController controller = Get.find();
  final RxList<Map<String, dynamic>> messages;

  MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Obx(() => ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: messages[index]['isUserMessage']
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              20,
                            ),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(
                                messages[index]['isUserMessage'] ? 0 : 20),
                            topLeft: Radius.circular(
                                messages[index]['isUserMessage'] ? 20 : 0),
                          ),
                          color: messages[index]['isUserMessage']
                              ? Colors.white
                              : Colors.black),
                      constraints: BoxConstraints(maxWidth: w * 2 / 3),
                      child: Text(
                        messages[index]['message'].text.text[0],
                        style: TextStyle(
                            color: messages[index]['isUserMessage']
                                ? Colors.black
                                : Colors.white),
                      )),
                ],
              ),
            );
          },
          separatorBuilder: (_, i) =>
              Padding(padding: EdgeInsets.only(top: 10)),
          itemCount: messages.length,
        ));
  }
}
