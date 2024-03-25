import 'package:dressur/widgets/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title,});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      shape: Border(
        bottom: BorderSide(
          width: 1,
          color: Color.fromARGB(80, 98, 143, 145),
        ),
      ),
      elevation: 1.0,
      centerTitle: true,
      title: Text(
        
        title,
        style: TextStyle(
          color: primaryColor,
        ),
      ),
      leading: IconButton(
         onPressed: () {
          // Ajouter la logique pour la navigation de retour ici
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: primaryColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.info,
            color: Color.fromARGB(255, 5, 39, 159),
          ),
        ),
      ],
    );
  }
}