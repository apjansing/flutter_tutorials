import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  String text;
  TextSection(String text) {
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        text,
        softWrap: true,
      ),
    );
  }
}
