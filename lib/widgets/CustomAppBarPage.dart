import 'package:dressur/widgets/color.dart';
import 'package:flutter/material.dart';

class CustomAppBarPage extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarPage({required this.title});
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final name = 'Dressur';
    return AppBar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      shape: Border(
        bottom: BorderSide(
          width: 1,
          color: Color.fromARGB(80, 98, 143, 145),
        ),
      ),
      elevation: 1.0,
      /*centerTitle: true,
      title: Text(
        
        title,
        style: TextStyle(
          color: primaryColor,
          fontSize: 20
        ),
      ),*/
      leadingWidth: 100,
      leading:Container(
        padding: EdgeInsets.only(top: 13),
        child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryColor,
              fontSize: 20
            ),
          ),
      ),
       actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.info,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
