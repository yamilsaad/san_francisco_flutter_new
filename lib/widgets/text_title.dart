import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final String texto_title;
  final textStyle =
      TextStyle(fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold);

  TextTitleWidget({super.key, required this.texto_title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        texto_title,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
