import 'package:attendenceapp/screens/student_details.dart';
import 'package:attendenceapp/services/firestore_service.dart';
import 'package:attendenceapp/widgets/bottom_cornner.dart';
import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:attendenceapp/widgets/textfield_widget.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:flutter/material.dart';

class EnterstudentScreen extends StatefulWidget {
  EnterstudentScreen({super.key, required this.idss});
  final String idss;

  @override
  State<EnterstudentScreen> createState() => _EnterstudentScreenState();
}

class _EnterstudentScreenState extends State<EnterstudentScreen> {
  final nameController = TextEditingController();

  final domainController = TextEditingController();

  final mobnumberController = TextEditingController();

  final genderController = TextEditingController();

  final emailidController = TextEditingController();

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
                      'Enter Student Details',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
          Textwidget(
              text: 'Enter  name', textEditingController: nameController),
          Textwidget(
              text: 'Enter domain', textEditingController: domainController),
          Textwidget(
              text: 'Enter mobile number',
              textEditingController: mobnumberController),
          Textwidget(
              text: 'Enter gender', textEditingController: genderController),
          Textwidget(
              text: 'Enter email id', textEditingController: emailidController),
          Padding(
            padding: const EdgeInsets.only(
              top: 22,
            ),
            child: GestureDetector(
              onTap: () async {
                if (nameController.text.isNotEmpty &&
                    domainController.text.isNotEmpty &&
                    mobnumberController.text.isNotEmpty &&
                    genderController.text.isNotEmpty &&
                    emailidController.text.isNotEmpty) {
                  try {
                    await FirestoreService().addstudent(
                        name: nameController.text,
                        domain: domainController.text,
                        mobnumber: mobnumberController.text,
                        gender: genderController.text,
                        emailid: emailidController.text,
                        id: widget.idss);
                    setState(() {
                      Navigator.pop(context, true);
                    });
                  } catch (e) {
                    rethrow;
                  }
                }
              },
              child: Container(
                width: 314,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ColorWidgets.kBlueColor),
                child: Center(
                    child: Text(
                  'Add New Student ',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: ColorWidgets.kWhiteColor),
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
