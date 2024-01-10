import 'package:flutter/material.dart';

class CornnerImage extends StatelessWidget {
  const CornnerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 193,
      height: 176,
      child: Image.asset(
        'images/Component 2.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
