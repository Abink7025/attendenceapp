import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:flutter/material.dart';

class StudentattendanceScreen extends StatelessWidget {
  StudentattendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            CornnerImage(),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Container(
                width: 390,
                height: 26,
                child: Center(
                  child: Text(
                    'Student Attendance',
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
      ]),
    );
  }
}
