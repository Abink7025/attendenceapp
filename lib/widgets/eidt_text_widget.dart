import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:flutter/material.dart';

class EidittextWidget extends StatelessWidget {
  const EidittextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: ColorWidgets.kBlackColor),
    );
  }
}
