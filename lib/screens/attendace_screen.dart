import 'package:attendenceapp/screens/absent_screen.dart';
import 'package:attendenceapp/screens/present_screen.dart';
import 'package:attendenceapp/screens/viewattendencegraph.dart';
import 'package:attendenceapp/services/firestore_service.dart';
import 'package:attendenceapp/widgets/attendance_widget.dart';
import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen({
    super.key,
    required this.idsd,
  });
  final String idsd;

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  int? checkIndex;

  List<DocumentSnapshot>? documents;
  bool loading = false;
  Future getData(BuildContext context) async {
    try {
      setState(() {
        loading = true;
      });
      final data = await FirebaseFirestore.instance
          .collection('student')
          .where('Batch id', isEqualTo: widget.idsd)
          .orderBy('Name')
          .get();

      documents = data.docs;

      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erorr is here!')));
    }
  }

  @override
  void initState() {
    getData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                      'Attendance',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : documents == null || documents!.isEmpty
                    ? Center(
                        child: Text('No data'),
                      )
                    : ListView.builder(
                        itemCount: documents!.length,
                        itemBuilder: (
                          context,
                          index,
                        ) =>
                            GestureDetector(
                          onTap: () async {
                            setState(() {
                              checkIndex = index;
                            });
                          },
                          child: AttendanceWidget(
                              texts: documents![index]['Name'].toString(),
                              idds: widget.idsd,
                              rollnum: (index + 1).toString(),
                              studentid: documents![index].id,
                              attendance: 'P',
                              onTap: () async {
                                try {
                                  await FirestoreService().addattendance(
                                    batchId: widget.idsd,
                                    date: DateTime.now(),
                                    attendance: 'P',
                                    studentId: documents![index].id,
                                    name: documents![index]['Name'].toString(),
                                  );
                                  documents?.removeWhere(
                                      (e) => e.id == documents![index].id);
                                  setState(() {});
                                } catch (e) {}
                              },
                              onTaps: () async {
                                try {
                                  await FirestoreService().addattendance(
                                      batchId: widget.idsd,
                                      date: DateTime.now(),
                                      attendance: 'Ab',
                                      studentId: documents![index].id,
                                      name:
                                          documents![index]['Name'].toString());
                                  documents?.removeWhere(
                                      (e) => e.id == documents![index].id);
                                  setState(() {});
                                } catch (e) {}
                              }),
                        ),
                      ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PresentScreen(
                  id: widget.idsd,
                ),
              ));
            },
            child: Container(
              width: 314,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorWidgets.kBlueColor),
              child: Center(
                child: Text(
                  'Present',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: ColorWidgets.kWhiteColor),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AbsentScreen(
                  id: widget.idsd,
                ),
              ));
            },
            child: Container(
              width: 314,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorWidgets.kBlueColor),
              child: Center(
                child: Text(
                  'Absent',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: ColorWidgets.kWhiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
