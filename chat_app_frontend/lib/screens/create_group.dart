import 'package:chat_app_frontend/custom_ui/avtar_card.dart';
import 'package:chat_app_frontend/custom_ui/contact_card.dart';
import 'package:chat_app_frontend/models/chat_model.dart';
import 'package:chat_app_frontend/pallete.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(
      name: "Ron",
      icon: "assets/person.svg",
      isGroup: false,
      time: "12:00",
      currentMessage: "Hello there!",
      status: "Magician",
      select: false,
    ),
    ChatModel(
      name: "Dreko",
      icon: "assets/person.svg",
      isGroup: false,
      time: "12:00",
      currentMessage: "Hello there!",
      status: "Villian",
      select: false,
    ),
    ChatModel(
      name: "Harry",
      icon: "assets/person.svg",
      isGroup: false,
      time: "12:00",
      currentMessage: "Hello there!",
      status: "Lead character",
      select: false,
    ),
  ];
  List<ChatModel> groups = [];

  void _onContactTap(ChatModel contact) {
    setState(() {
      contact.select = !contact.select;
      if (contact.select) {
        groups.add(contact);
      } else {
        groups.remove(contact);
      }
    });
  }

  void _removeContact(ChatModel contact) {
    setState(() {
      contact.select = false;
      groups.remove(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "Add participants",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          if (groups.isNotEmpty)
            Container(
              height: 75,
              color: Pallete.whiteColor,
              child: ListView.builder(
                itemCount: groups.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => AvtarCard(
                  contact: groups[index],
                  onRemove: () => _removeContact(groups[index]),
                ),
              ),
            ),
          if (groups.isNotEmpty)
            Divider(
              thickness: 1,
            ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => _onContactTap(contacts[index]),
                  child: ContactCard(contact: contacts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
