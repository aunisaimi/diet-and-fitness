import 'package:dietandfitness/common/color_extension.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  //final String hintText;
  final bool obscureText;
  final String labelText;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    //required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.labelText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffF8F6F9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.cyan.shade700),
          ),
          fillColor: const Color(0xffF8F6F9),
          filled: true,
          //hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: TColor.primary),
          hintStyle: TextStyle(
              color: TColor.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
}
