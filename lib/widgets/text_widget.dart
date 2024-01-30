import 'package:flutter/material.dart';

class StudentTextWidget extends StatelessWidget {
  StudentTextWidget(
      {super.key, required this.leftText, required this.rightText});
  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Padding(
        padding: const EdgeInsets.only(top: 57),
        child: Row(
          children: [
            SizedBox(
                height: 26,
                width: 184,
                child: Text(
                  leftText,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                )),
            Text(
              rightText,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
