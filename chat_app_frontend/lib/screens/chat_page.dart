import 'package:chat_app_frontend/custom_ui/custom_card.dart';
import 'package:chat_app_frontend/models/chat_model.dart';
import 'package:chat_app_frontend/pallete.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Voldmort",
      isGroup: false,
      currentMessage: "Hello Potter, Voldmort here!",
      time: "18:18",
      icon: "assets/person.svg",
    ),
    ChatModel(
      name: "Harry Potter",
      isGroup: false,
      currentMessage: "What's Up, Voldmort",
      time: "18:30",
      icon: "assets/person.svg",
    ),
    ChatModel(
      name: "Hogwarts",
      isGroup: true,
      currentMessage: "Hello everyone, Dumbledore here!",
      time: "17:17",
      icon: "assets/groups.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.chat,
          color: Pallete.whiteColor,
        ),
        backgroundColor: Pallete.accentColor,
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
    );
  }
}
