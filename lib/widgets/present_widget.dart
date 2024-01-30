import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:flutter/material.dart';

class PresentWidget extends StatelessWidget {
  const PresentWidget({super.key, required this.text, required this.ids, required this.color});
  final String text;
  final String ids;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color
      ),
      child: Center(child: Text(text)),
    );
  }
}
