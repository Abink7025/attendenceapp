import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:flutter/material.dart';

class StudneteditScreen extends StatefulWidget {
  StudneteditScreen({super.key});

  @override
  State<StudneteditScreen> createState() => _StudneteditScreenState();
}

class _StudneteditScreenState extends State<StudneteditScreen> {
  final batchnameController = TextEditingController();

  final nameController = TextEditingController();

  final domainController = TextEditingController();

  final emailController = TextEditingController();

  final genderController = TextEditingController();

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
                'Edit Student Details',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              )),
            ),
          )
        ],
      ),
    ]));
  }
}
