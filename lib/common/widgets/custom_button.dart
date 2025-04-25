import 'package:flutter/material.dart';

class CustomButton
    extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: onTap,
    //   style: ElevatedButton.styleFrom(
    //     minimumSize: const Size(
    //       double.infinity,
    //       50,
    //     ),
    //   ),
    //   child: Text(text),
    // );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight:
                  FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
