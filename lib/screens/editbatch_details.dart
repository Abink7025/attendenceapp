import 'package:attendenceapp/screens/batch_details.dart';
import 'package:attendenceapp/services/firestore_service.dart';
import 'package:attendenceapp/widgets/bottom_cornner.dart';
import 'package:attendenceapp/widgets/textfield_widget.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:flutter/material.dart';

class EditbatchScreen extends StatefulWidget {
  EditbatchScreen(
      {super.key,
      required this.idss,
      required this.batchname,
      required this.location,
      required this.batchleader,
      required this.mobile});
  final String idss;
  final String batchname;
  final String location;
  final String batchleader;
  final String mobile;

  @override
  State<EditbatchScreen> createState() => _EditbatchScreenState();
}

class _EditbatchScreenState extends State<EditbatchScreen> {
  TextEditingController batchnameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController batchleaderController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    batchnameController.text = widget.batchname;
    locationController.text = widget.location;
    batchleaderController.text = widget.batchleader;
    mobileController.text = widget.mobile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CornnerImage(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 150,
                  ),
                  child: Container(
                    width: 390,
                    height: 26,
                    child: Center(
                      child: Text(
                        'Edit Batch Details',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
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
                  SizedBox(
                    width: 250,
                    child: Textwidget(
                        text: '', textEditingController: batchnameController),
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
                  SizedBox(
                    width: 250,
                    child: Textwidget(
                        text: '', textEditingController: locationController),
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
                  SizedBox(
                    width: 250,
                    child: Textwidget(
                        text: '', textEditingController: batchleaderController),
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
                  SizedBox(
                      width: 250,
                      child: Textwidget(
                          text: '', textEditingController: mobileController))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                  onTap: () async {
                    try {
                      await FirestoreService().updates(
                          docId: widget.idss,
                          batchname: batchnameController.text,
                          location: locationController.text,
                          leadername: batchleaderController.text,
                          leadermobile: mobileController.text);
                    } catch (e) {}

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BatchdetailScreen(
                        ids: widget.idss,
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
                      'Save',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    )),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 158),
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 80,
                  height: 84,
                  child: BottomCornner(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
