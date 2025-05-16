import 'dart:io';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {

  final String title;
  final IconData icon;

  File ? selectedImage;
  VoidCallback onPressed;
  Options({
    this.selectedImage,
    required this.onPressed,
    required this.title,
    required this.icon,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          IconButton(color: selectedImage == null ? Colors.grey.shade800 : Colors.red,
            icon:Icon(icon),onPressed:onPressed,),
          Text(title, style: TextStyle(color: selectedImage == null ? Colors.grey.shade800 : Colors.red),)
        ],
      );
  }
}