import 'package:flutter/material.dart';

class QuickBox extends StatelessWidget {
  const QuickBox({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
