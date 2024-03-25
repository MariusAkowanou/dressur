import 'package:dressur/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Vérification"),
      body: Container(
      child: Column(
        children: [
         titleEvent("Numero de Téléphone", "Un numéro de téléphone verifié est obligatoi pour faire des boost et de publicité"),
         SizedBox(height: 12,),
          

         titleEvent("Adress email", "Vérifie l'adress mail")
        ]
      ),
    )
    );
  }
}

Widget titleEvent(String Title , String description){
  return  Container(
            
            child: ListTile(
              title: Text(
                //"Numero de Téléphone ",
                Title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  description
                  //"Un numéro de téléphone verifié est obligatoi pour faire des boost et de publicité"
                ),
              ),
            ),
          );
      
}