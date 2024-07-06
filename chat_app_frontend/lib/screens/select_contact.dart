import 'package:chat_app_frontend/custom_ui/button_card.dart';
import 'package:chat_app_frontend/custom_ui/contact_card.dart';
import 'package:chat_app_frontend/models/chat_model.dart';
import 'package:chat_app_frontend/screens/create_group.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "270 Contacts",
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                child: Text("Invite a friend"),
                value: "Invite a friend",
              ),
              const PopupMenuItem(
                child: Text("Contacts"),
                value: "Contacts",
              ),
              const PopupMenuItem(
                child: Text("Refresh"),
                value: "Refresh",
              ),
              const PopupMenuItem(
                child: Text("Help"),
                value: "Help",
              ),
            ];
          })
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => CreateGroup()));
                },
                child: ButtonCard(
                  icon: Icons.group,
                  name: "New group",
                ),
              );
            } else if (index == 1) {
              return ButtonCard(
                icon: Icons.person_add,
                name: "Add contact",
              );
            }
            return ContactCard(contact: contacts[index - 2]);
          }),
    );
  }
}
