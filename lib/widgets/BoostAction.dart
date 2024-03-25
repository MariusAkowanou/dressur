import 'package:dressur/widgets/boxDialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CardActionBox extends StatelessWidget {
  const CardActionBox(
      {required this.animation,
      required this.descriptionCard,
      required this.button});
  final String animation;
  final String descriptionCard;
  final String button;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        color: Color.fromARGB(66, 244, 248, 248),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  animation,
                  height: height / 8,
                  width: width,
                ),
                Center(
                  child: Text(
                    descriptionCard,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width/2,
              margin: EdgeInsets.only(left: 10),
              child:BoxDialog(button: button,)
            )
            
          ],
        ),
      ),
    );
  }
}
