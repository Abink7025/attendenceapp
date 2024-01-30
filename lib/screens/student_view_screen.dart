import 'package:attendenceapp/screens/student_attendance_screen.dart';
import 'package:attendenceapp/screens/student_edit_screen.dart';
import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:attendenceapp/widgets/text_widget.dart';
import 'package:attendenceapp/widgets/textfield_widget.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:flutter/material.dart';

class StudentviewScreen extends StatefulWidget {
  StudentviewScreen(
      {super.key,
      required this.batchname,
      required this.name,
      required this.domain,
      required this.email,
      required this.gender});
  final String batchname;
  final String name;
  final String domain;
  final String email;
  final String gender;

  @override
  State<StudentviewScreen> createState() => _StudentviewScreenState();
}

class _StudentviewScreenState extends State<StudentviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Stack(
        children: [
          CornnerImage(),
          Padding(
            padding: const EdgeInsets.only(top: 94, left: 290),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StudneteditScreen(),
                      ));
                    },
                    icon: Icon(
                      Icons.edit,
                      color: ColorWidgets.kBlueColor,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: ColorWidgets.kBlueColor,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              width: 390,
              height: 26,
              child: Center(
                child: Text(
                  'Student details',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      StudentTextWidget(leftText: 'Batch name :', rightText: widget.batchname),
      StudentTextWidget(leftText: 'Name :', rightText: widget.name),
      StudentTextWidget(leftText: 'Domain :', rightText: widget.domain),
      StudentTextWidget(leftText: 'Email id :', rightText: widget.email),
      StudentTextWidget(leftText: 'Gender :', rightText: widget.gender),
      SizedBox(
        height: 20,
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => StudentattendanceScreen(),
          ));
        },
        child: Container(
          width: 314,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: ColorWidgets.kBlueColor,
          ),
          child: Center(
              child: Text(
            'Student attendance',
            style: TextStyle(
              color: ColorWidgets.kWhiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          )),
        ),
      )
    ]));
  }
}
