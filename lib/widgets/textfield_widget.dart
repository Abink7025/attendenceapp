import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  Textwidget(
      {super.key,
      required this.text,
      required this.textEditingController,
      this.style});
  final String text;
  final TextEditingController textEditingController;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromRGBO(217, 217, 217, 0.42)),
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 30),
              hintText: text,
              hintStyle: style,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
