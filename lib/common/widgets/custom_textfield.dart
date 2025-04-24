import 'package:flutter/material.dart';

class CustomTextfield
    extends StatelessWidget {
  final TextEditingController
  controller;
  final String hintText;
  final bool obscureText;
  final int maxLines;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (val == null ||
            val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder:
            OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    Colors
                        .grey
                        .shade400,
              ),
            ),
        focusedBorder:
            OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    Colors
                        .orange
                        .shade400,
              ),
            ),
        fillColor: const Color.fromARGB(188, 245, 245, 245),
        filled: true,
      ),
    );
  }
}
