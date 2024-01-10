import 'package:attendenceapp/screens/attendace_screen.dart';
import 'package:attendenceapp/screens/editbatch_details.dart';
import 'package:attendenceapp/screens/student_details.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:flutter/material.dart';

class BatchdetailScreen extends StatelessWidget {
  const BatchdetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              CornnerImage(),
              Padding(
                padding: const EdgeInsets.only(top: 94, left: 290),
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditbatchScreen(),
                          ));
                        },
                        icon: Icon(Icons.edit),
                        color: Color.fromRGBO(4, 150, 150, 1),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        color: Color.fromRGBO(4, 150, 150, 1),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 150,
                ),
                child: Container(
                  width: 390,
                  height: 26,
                  child: Center(
                      child: Text(
                    ' Batch Details',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  )),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Row(
                children: [
                  Text(
                    'Batch name :',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.8)),
                  ),
                  Text(
                    '  BCK90',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.8)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Row(
                children: [
                  Text(
                    'Location :',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.8)),
                  ),
                  Text(
                    '  kinfra, Kakkachery',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.8)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 50),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Batch Lead Details',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.8)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Row(
                children: [
                  Text(
                    'Batch Leader :',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.8)),
                  ),
                  Text(
                    '  Vismaya',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.8)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Row(
                children: [
                  Text(
                    'Mobile :',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.8)),
                  ),
                  Text(
                    '  9400500284',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.8)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AttendanceScreen(),
                    ));
                  },
                  child: Container(
                    width: 314,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color.fromRGBO(27, 182, 182, 1)),
                    child: Center(
                        child: Text(
                      'Attendance',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    )),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StudentdetailScreen(),
                    ));
                  },
                  child: Container(
                    width: 314,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color.fromRGBO(27, 182, 182, 1)),
                    child: Center(
                        child: Text(
                      'Student details',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    )),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
