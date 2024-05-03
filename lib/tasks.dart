import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late File userImage;

  @override
  void initState() {
    super.initState();
    _loadImagePath();
  }

  _loadImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('imagePath') ?? 'assets/logo.png';
    setState(() {
      userImage = File(imagePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.file(userImage),
          title: const Text('Tasks'),
        ),
        body: const Column());
  }
}
