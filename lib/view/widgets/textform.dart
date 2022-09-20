import 'package:flutter/material.dart';
import 'package:note_app/controller/colors.dart';

class TextFeald extends StatelessWidget {
  TextFeald({Key? key, required this.controller, required this.title})
      : super(key: key);

  final TextEditingController controller;

  final String title;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: title, hintStyle: const TextStyle(color: amber)),
      autofocus: true,
      controller: controller,
    );
  }
}