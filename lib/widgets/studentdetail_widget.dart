import 'package:attendenceapp/screens/student_view_screen.dart';
import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:flutter/material.dart';

class StudentdetailWidget extends StatefulWidget {
  StudentdetailWidget(
      {super.key,
      required this.texts,
      required this.batchname,
      required this.domain,
      required this.email,
      required this.gender});
  final String texts;
  final String batchname;
  final String domain;
  final String email;
  final String gender;

  @override
  State<StudentdetailWidget> createState() => _StudentdetailWidgetState();
}

class _StudentdetailWidgetState extends State<StudentdetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 22, left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          print('ddddd');
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => StudentviewScreen(
              batchname: widget.batchname,
              name: widget.texts,
              domain: widget.domain,
              email: widget.email,
              gender: widget.gender,
            ),
          ));
        },
        child: Container(
          width: 312,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorWidgets.kGreyColor),
          child: Center(child: Text(widget.texts)),
        ),
      ),
    );
  }
}
