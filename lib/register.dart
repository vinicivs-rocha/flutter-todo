import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_todo/gradient_border.dart';
import 'package:flutter_todo/gradient_button.dart';
import 'package:flutter_todo/profile_image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? _imageFile;

  void _onImagePicked(File file) {
    setState(() {
      _imageFile = file;
    });
    print('Image picked: ${file.path}');
  }

  void _onGetStarted() {
    print('Get Started');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 20,
          right: 20,
          bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/scheduling.png', height: 360),
            const SizedBox(height: 12),
            ProfileImagePicker(
              imageFile: _imageFile,
              onImagePicked: _onImagePicked,
            ),
            const SizedBox(height: 40),
            GradientBorder(
                child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(22)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Name',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                          fontSize: 20)),
                  const SizedBox(height: 8),
                  TextField(
                    style: TextStyle(color: Colors.grey[400]),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        hintText: 'Enter your name',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 40),
            GradientButton(
              onPressed: _onGetStarted,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Get Started",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
