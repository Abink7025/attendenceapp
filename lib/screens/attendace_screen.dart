import 'package:attendenceapp/screens/viewattendencegraph.dart';
import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

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
          Padding(
            padding: const EdgeInsets.only(top: 415),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 314,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ColorWidgets.kBlueColor),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
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
                builder: (context) => AttendencegraphScreen(),
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
                  'View attendance',
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
