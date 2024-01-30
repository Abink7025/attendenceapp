import 'package:attendenceapp/services/firestore_service.dart';
import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:flutter/material.dart';

class AttendanceWidget extends StatefulWidget {
  AttendanceWidget({
    super.key,
    required this.texts,
    required this.idds,
    required this.rollnum,
    required this.studentid,
    required this.attendance,
    required this.onTap, required this.onTaps,
  });
  final String idds;
  final String rollnum;

  final String texts;
  final String studentid;
  final String attendance;
  final VoidCallback onTap;
  final VoidCallback onTaps;

  @override
  State<AttendanceWidget> createState() => _AttendanceWidgetState();
}

class _AttendanceWidgetState extends State<AttendanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: ColorWidgets.kGreyColor,
      ),
      child: Row(children: [
        Text(widget.rollnum),
        SizedBox(
          width: 20,
        ),
        Text(widget.texts),
        SizedBox(
          width: 120,
        ),
        TextButton(onPressed: widget.onTap, child: Text('P')),
        SizedBox(
          width: 20,
        ),
        TextButton(onPressed: widget.onTaps, child: Text('Ab'))
      ]),
    );
  }
}
