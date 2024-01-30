import 'package:attendenceapp/screens/present_screen.dart';
import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:attendenceapp/widgets/present_widget.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AbsentScreen extends StatefulWidget {
  const AbsentScreen({super.key, required this.id});
  final String id;

  @override
  State<AbsentScreen> createState() => _AbsentScreenState();
}

class _AbsentScreenState extends State<AbsentScreen> {
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
                  'Absent',
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
      Expanded(
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('attendance')
              .where('Batch id', isEqualTo: widget.id)
              .where('Attendance', isEqualTo: 'Ab')
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data!.docs;

              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (
                    context,
                    index,
                  ) =>
                      PresentWidget(
                        ids: widget.id,
                        text: documents[index]['Student name'].toString(),
                        color: ColorWidgets.kRedColor,
                      ));
            } else if (snapshot.hasError) {
              return Text('Its Error!');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    ]));
  }
}
