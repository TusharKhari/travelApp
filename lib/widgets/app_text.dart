import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  int size;
  final Color color;
  final String text;

  AppText({
    super.key,
     this.color = Colors.black54,
     this.size = 16,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size.toDouble(),
        color: color,
      ),
    );
  }
}
