import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo/gradient_border.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker(
      {super.key, this.imageFile, required this.onImagePicked});

  final File? imageFile;
  final void Function(File) onImagePicked;

  Future<void> _pickImage(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      onImagePicked(File(pickedFile.path));
    } on PlatformException {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to pick image'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _pickImage(context);
          },
          child: GradientBorder(
            padding: imageFile == null ? 2 : 0,
            child: imageFile == null
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
                    child: Image.file(imageFile!)),
          ),
        ),
        const SizedBox(height: 4), // Add this line
        if (imageFile == null)
          Text('Add picture',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
      ],
    );
  }
}
