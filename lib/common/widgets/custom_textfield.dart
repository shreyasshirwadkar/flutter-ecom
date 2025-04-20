import 'package:flutter/material.dart';

class CustomTextfield
    extends StatelessWidget {
  final TextEditingController
  controller;
  final String hintText;
  final bool obscureText;
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
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
        fillColor: Colors.grey.shade100,
        filled: true,
      ),
    );
  }
}
