import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Trolley extends StatelessWidget {
  const Trolley({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Trolley'),
    )
    );
  }
}