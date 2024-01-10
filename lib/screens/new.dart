import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  NewScreen({super.key});

  List<int> numList = [1, 2, 3, 4, 56, 7, 8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView.builder(
        itemCount: numList.length,
        itemBuilder: (context, index) {
          return Text(numList[index].toString());
        },
      ),
    ));
  }
}
