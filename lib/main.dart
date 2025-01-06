import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/list.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListPage(),
    );
  }
}