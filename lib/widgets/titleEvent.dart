import 'package:dressur/widgets/color.dart';
import 'package:flutter/material.dart';

class TitleEvent extends StatelessWidget {
  const TitleEvent({required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: Icon(
            Icons.fiber_manual_record,
            size: 10,
            color: SecondColor,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryColor
            ),
          ),
          
        );
  }
}