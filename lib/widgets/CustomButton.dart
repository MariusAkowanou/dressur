import 'package:dressur/widgets/color.dart';
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({required this.buttonText ,required this.page});
  final String buttonText;
  final Widget page;

  @override
  Widget build(BuildContext context) {
   
    return Container(
      child: TextButton(
    style: ButtonStyle(
      backgroundColor:
          MaterialStatePropertyAll<Color>(SecondColor),
    ),
    onPressed: () {
     Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => page,));
    },
    child: Row(
      children: [
        Icon(
          Icons.add,
          color:  Colors.white,
          weight: 2,
          //size: 20,
        ),
        SizedBox(width: 3,),
        Text(
          buttonText,
          style: TextStyle(color: Colors.white,),
        )
      ],
    ),
  ));
  }
}
