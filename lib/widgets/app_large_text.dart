import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  int size;
  final String text;
  final Color color;
   AppLargeText({super.key, required this.text,  this.color = Colors.black,  this.size = 30});

  @override
  Widget build(BuildContext context) {
    return Text(
    text, style: TextStyle(
      fontSize: double.parse(size.toString()),
      color: color,
      fontWeight: FontWeight.bold,
      
    ),
    );
  }
}

