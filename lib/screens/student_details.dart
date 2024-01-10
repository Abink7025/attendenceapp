import 'package:attendenceapp/screens/enterstud_details.dart';
import 'package:attendenceapp/widgets/bottom_cornner.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:flutter/material.dart';

class StudentdetailScreen extends StatelessWidget {
  const StudentdetailScreen({super.key});

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
                  padding: const EdgeInsets.only(top: 150),
                  child: Container(
                    width: 390,
                    height: 26,
                    child: Center(
                        child: Text(
                      'Students Details',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 485,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EnterstudentScreen(),
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
      ),
    );
  }
}
