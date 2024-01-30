import 'package:attendenceapp/screens/enterstud_details.dart';
import 'package:attendenceapp/widgets/bottom_cornner.dart';
import 'package:attendenceapp/widgets/studentdetail_widget.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentdetailScreen extends StatefulWidget {
  const StudentdetailScreen(
      {super.key, required this.idd, required this.batch});
  final String idd;
  final String batch;

  @override
  State<StudentdetailScreen> createState() => _StudentdetailScreenState();
}

class _StudentdetailScreenState extends State<StudentdetailScreen> {
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
                    'Students  List',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  )),
                ),
              )
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('student')
                  .where('Batch id', isEqualTo: widget.idd)
                  .orderBy('Name')
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // <3> Retrieve `List<DocumentSnapshot>` from snapshot

                  final List<DocumentSnapshot> documents = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) => StudentdetailWidget(
                      texts: documents[index]['Name'].toString(),
                      batchname: widget.batch,
                      domain: documents[index]['Domain'],
                      email: documents[index]['Email'],
                      gender: documents[index]['Gender'],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Its Error!');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 48,
            ),
            child: GestureDetector(
              onTap: () async {
                bool? a = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EnterstudentScreen(idss: widget.idd),
                ));
                if (a != null && a == true) {
                  setState(() {});
                }
              },
              child: Container(
                width: 314,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromRGBO(27, 182, 182, 1)),
                child: Center(
                    child: Text(
                  'Add New Student ',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                )),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(height: 84, width: 80, child: BottomCornner()))
        ],
      ),
    );
  }
}
