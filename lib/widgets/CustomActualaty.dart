import 'package:flutter/material.dart';

class CustomActualyPage extends StatelessWidget {
  const CustomActualyPage({required this.image, required this.description});
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: height/5,
            width: width,
            child: Image.asset(
              image,
              fit: BoxFit.cover,  
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Center(
              child:Text(description),
            ),
          )
        ],
      ),
    ),
    );
  }
}