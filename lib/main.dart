import 'package:chatgpt/screens/chat_screens.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor, //Background color
        appBarTheme: AppBarTheme(color: cardColor),
      ),
      home: const ChatScreen(),
    );
  }
}
