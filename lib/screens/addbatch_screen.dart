import 'package:attendenceapp/controller/auth_controller.dart';
import 'package:attendenceapp/screens/batch_details.dart';
import 'package:attendenceapp/screens/home_screen.dart';
import 'package:attendenceapp/services/firestore_service.dart';
import 'package:attendenceapp/widgets/textfield_widget.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:flutter/material.dart';

class AddbatchScreen extends StatefulWidget {
  AddbatchScreen({super.key});

  @override
  State<AddbatchScreen> createState() => _AddbatchScreenState();
}

class _AddbatchScreenState extends State<AddbatchScreen> {
  final _batchNameContrller = TextEditingController();

  final _locationController = TextEditingController();

  final _numberStudentController = TextEditingController();

  final _leaderNameController = TextEditingController();

  final _leaderMobilenumberController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
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
                        'Enter Batch Details',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    )),
              )
            ],
          ),
          Textwidget(
            textEditingController: _batchNameContrller,
            text: 'Enter batch name',
          ),
          Textwidget(
              text: 'Enter location',
              textEditingController: _locationController),
          Textwidget(
              text: 'Enter number of student',
              textEditingController: _numberStudentController),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              width: 390,
              height: 26,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  'Batch Lead Details',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ),
            ),
          ),
          Textwidget(
              text: 'Enter batch leaders name',
              textEditingController: _leaderNameController),
          Textwidget(
              text: 'Enter batch leaders mobile number',
              textEditingController: _leaderMobilenumberController),
          Padding(
            padding: const EdgeInsets.only(top: 53),
            child: GestureDetector(
              onTap: () async {
                if (_batchNameContrller.text.isNotEmpty &&
                    _locationController.text.isNotEmpty &&
                    _numberStudentController.text.isNotEmpty &&
                    _leaderNameController.text.isNotEmpty &&
                    _leaderMobilenumberController.text.isNotEmpty) {
                  try {
                    await FirestoreService().addBatch(
                        batchname: _batchNameContrller.text,
                        location: _locationController.text,
                        numberofstudent: _numberStudentController.text,
                        leadername: _leaderNameController.text,
                        leadermobile: _leaderMobilenumberController.text);
                    Navigator.pop(context);
                    
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
                    color: Color.fromRGBO(27, 182, 182, 1)),
                child: Center(
                    child: Text(
                  'Save',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
