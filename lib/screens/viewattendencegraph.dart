import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:flutter/material.dart';

class AttendencegraphScreen extends StatelessWidget {
  const AttendencegraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [CornnerImage()],
          )
        ],
      ),
    );
  }
}
