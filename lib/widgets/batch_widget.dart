import 'package:attendenceapp/screens/batch_details.dart';
import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:flutter/material.dart';

class BatchWidget extends StatefulWidget {
  BatchWidget({super.key, required this.text, required this.id, required this.onPressed});
  final String text;
  final String id;
  final VoidCallback onPressed;

  @override
  State<BatchWidget> createState() => _BatchWidgetState();
}

class _BatchWidgetState extends State<BatchWidget> {
  @override
  Widget build(BuildContext context) {
    print('build narku');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: GestureDetector(
            onTap:widget.onPressed,
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(85.9),
                  color: ColorWidgets.kBlueColor),
              child: Center(
                  child: Text(
                widget.text,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.8,
                    color: ColorWidgets.kWhiteColor),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
