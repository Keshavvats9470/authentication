import 'package:authconnect/utils/globals_colors.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const ButtonPage({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: GlobalColors.mainSecColor),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
