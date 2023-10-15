import 'package:authconnect/utils/globals_colors.dart';
import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const TextFieldPage(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: GlobalColors.fifthColor.withOpacity(.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: GlobalColors.grayColor.withOpacity(.7),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
