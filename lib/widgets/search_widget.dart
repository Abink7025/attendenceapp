
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 30,
      child: Stack(
        children: [
          
          TextField(
            decoration: InputDecoration(hintText: 'search'),
          ),
         
        ],
      ),
    );
  }
}
