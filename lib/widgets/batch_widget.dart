import 'package:flutter/material.dart';

class BatchWidget extends StatefulWidget {
  BatchWidget({super.key, required this.text});
  final String text;

  @override
  State<BatchWidget> createState() => _BatchWidgetState();
}

class _BatchWidgetState extends State<BatchWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(85.9),
                color: Color.fromRGBO(4, 150, 150, 1)),
            child: Center(
                child: Text(
              widget.text,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.8),
            )),
          ),
        ),
      ],
    );
  }
}
