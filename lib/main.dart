import 'package:flutter/material.dart';
import 'package:flutter_todo/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo List App',
        theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
        home: const HomePage());
  }
}
