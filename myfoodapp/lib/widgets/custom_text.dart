import 'package:flutter/material.dart';
//This is a generalised class for styling text
class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  const CustomText({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }
}
