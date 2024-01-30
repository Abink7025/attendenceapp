import 'package:attendenceapp/screens/attendace_screen.dart';
import 'package:attendenceapp/screens/editbatch_details.dart';
import 'package:attendenceapp/screens/student_details.dart';
import 'package:attendenceapp/services/firestore_service.dart';
import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BatchdetailScreen extends StatefulWidget {
  const BatchdetailScreen({super.key, required this.ids});
  final String ids;

  @override
  State<BatchdetailScreen> createState() => _BatchdetailScreenState();
}

class _BatchdetailScreenState extends State<BatchdetailScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.ids);
    return Scaffold(
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('batch')
              .doc(widget.ids)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
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
                                  builder: (context) => EditbatchScreen(
                                    idss: widget.ids,
                                    batchname: snapshot.data!['Batchname'],
                                    location: snapshot.data!['loctation'],
                                    batchleader: snapshot.data!['Leadername'],
                                    mobile: snapshot.data!['Leadermobile'],
                                  ),
                                ));
                              },
                              icon: Icon(Icons.edit),
                              color: ColorWidgets.kBlueColor,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            child: IconButton(
                              onPressed: () async {
                                try {
                                  await FirestoreService().delete(widget.ids);
                                  Navigator.pop(context, true);
                                } catch (e) {}
                              },
                              icon: Icon(Icons.delete),
                              color: ColorWidgets.kBlueColor,
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
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
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
                          snapshot.data!['Batchname'],
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
                          snapshot.data!['loctation'],
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
                          snapshot.data!['Leadername'],
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
                          snapshot.data!['Leadermobile'],
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
                            builder: (context) => AttendanceScreen(
                              idsd: widget.ids, 
                              
                            ),
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
                            builder: (context) => StudentdetailScreen(
                              idd: widget.ids, batch: snapshot.data!['Batchname'],
                            ),
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
              );
            } else if (snapshot.hasError) {
              return Text('Its Error!');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
