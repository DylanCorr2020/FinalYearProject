import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

//This is a reusable customerizable button used throughout the app
class AppButtons extends StatelessWidget {
  const AppButtons({
    Key? key = null,
    required this.text,
    required this.widthSize,
    required this.heightSize,
    required this.textcolor,
    required this.backgroundColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Color? textcolor;
  final Color borderColor;
  final Color? backgroundColor;
  final double widthSize;
  final double heightSize;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthSize,
      height: heightSize,
      child: InkWell(
        onTap: () => onTap(),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textcolor, fontSize: 20),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor, width: 1.0)),
    );
  }
}
