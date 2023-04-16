import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget
{
  final controller;
  final suffixIcon;
  final String hintText;
  final bool obscureText;
  const MyTextField(
  {
      super.key,
      required this.controller,
      required this.suffixIcon,
      required this.hintText,
      required this.obscureText,
  });

  @override
  Widget build(BuildContext context)
  {
    return TextFormField(
      validator: (val) => val!.isEmpty ? "Enter your $hintText!" : null,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500)
      ),
    );
  }
}