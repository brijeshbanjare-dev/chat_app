import 'package:chat_app_frontend/pallete.dart';
import 'package:chat_app_frontend/screens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Pallete.primaryColor),
        title: const Text(
          'WhatsApp Clone',
          style: TextStyle(color: Pallete.whiteColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Pallete.whiteColor,
          ),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                child: Text("New group"),
                value: "New group",
              ),
              const PopupMenuItem(
                child: Text("New broadcast"),
                value: "New Broadcast",
              ),
              const PopupMenuItem(
                child: Text("Whatsapp Web"),
                value: "Whatsapp Web",
              ),
              const PopupMenuItem(
                child: Text("Starred Message"),
                value: "Starred Message",
              ),
              const PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              )
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          Center(child: Text("camera")),
          ChatPage(),
          Center(child: Text("status")),
          Center(child: Text("calls")),
        ],
      ),
    );
  }
}
