import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:attendenceapp/widgets/present_widget.dart';
import 'package:attendenceapp/widgets/text_widget.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PresentScreen extends StatefulWidget {
  PresentScreen({
    super.key,
    required this.id,
    
  });
  final String id;


  @override
  State<PresentScreen> createState() => _PresentScreenState();
}

class _PresentScreenState extends State<PresentScreen> {
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
                  'Present',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
      Expanded(
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('attendance')
              .where('Batch id', isEqualTo: widget.id)
              .where('Attendance', isEqualTo: 'P')
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
                        color: ColorWidgets.kGreenColor,
                      ));
            } else if (snapshot.hasError) {
              return Text('Its Error!');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      StudentTextWidget(
          leftText: 'Total present', rightText: 'present'),
      SizedBox(
        height: 30,
      )
    ]));
  }
}
