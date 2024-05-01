import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo/gradient_border.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({super.key});

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _imageFile;

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: GradientBorder(
            padding: _imageFile == null ? 2 : 0,
            child: _imageFile == null
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    padding: const EdgeInsets.all(40),
                    child: Icon(
                      Icons.camera_enhance,
                      size: 48,
                      color: Colors.blue[400],
                    ))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.file(_imageFile!)),
          ),
        ),
        const SizedBox(height: 4), // Add this line
        if (_imageFile == null)
          Text('Add picture',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
      ],
    );
  }
}
