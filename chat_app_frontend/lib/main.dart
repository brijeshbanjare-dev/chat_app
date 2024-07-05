import 'package:chat_app_frontend/pallete.dart';
import 'package:chat_app_frontend/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Pallete.accentColor,
        appBarTheme: const AppBarTheme(
          color: Pallete.accentColor,
          iconTheme: IconThemeData(color: Pallete.whiteColor),
          titleTextStyle: TextStyle(
            color: Pallete.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Pallete.whiteColor),
        tabBarTheme: const TabBarTheme(
          labelColor: Pallete.whiteColor,
          unselectedLabelColor: Pallete
              .liteGreyColor, // Adjust this to slightly differentiate unselected tabs
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Pallete.whiteColor, width: 2.0),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
