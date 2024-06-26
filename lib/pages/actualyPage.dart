import 'package:dressur/model/PubDataItems.dart';
import 'package:dressur/widgets/BoostAction.dart';
import 'package:dressur/widgets/CustomActualaty.dart';
import 'package:dressur/widgets/CustomAppBarPage.dart';
import 'package:dressur/widgets/titleEvent.dart';
import 'package:flutter/material.dart';

class ActualityPage extends StatefulWidget {
  const ActualityPage({Key? key}) : super(key: key);

  @override
  State<ActualityPage> createState() => _ActualityPageState();
}

class _ActualityPageState extends State<ActualityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarPage(title: 'Acceuil'),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          TitleEvent(title: "Booster vos contacts"),
          Container(
            margin: EdgeInsets.all(10),
            child: CardActionBox(
              animation: "animations/teste.json", 
              descriptionCard: "Faite un boost pour avoir plus de contact selon vos critères", 
              button: "Faire booste")
          ),
          SizedBox(
            height: 10,
          ),
          TitleEvent(title: "Actualités"),
          Container(
            height: MediaQuery.of(context).size.height / 2.8,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: PubDataItem().items.map((pub) {
                return Container(
                  width: MediaQuery.of(context).size.width * .9,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: CustomActualyPage(
                    image: pub.imagePath,
                    description: pub.description,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
