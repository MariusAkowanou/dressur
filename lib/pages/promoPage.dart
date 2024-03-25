import 'package:dressur/widgets/BoostAction.dart';
import 'package:dressur/widgets/CustomAppBarPage.dart';
import 'package:dressur/widgets/pubActionBox.dart';
import 'package:dressur/widgets/titleEvent.dart';
import 'package:flutter/material.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarPage(title: 'Promo'),
      body: ListView(
        children: [
          SizedBox(
              height: 10,
            ),
            TitleEvent(title: "Booster vos contact"),
            Container(
              margin: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: CardActionBox(
                animation: 'animations/teste.json',
                descriptionCard:"Faite un boost pour avoir plus de contacte selon vos critère ",
                button: 'faire boost',
              ),
            ),
             SizedBox(
              height: 10,
            ),
            TitleEvent(title: "Faire une publicité "),
             Container(
              margin: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: PubActionBox(
                animation: 'animations/teste.json',
                descriptionCard:"Augmenter votre productivité avec une publicité ",
                button: 'Faire Pub',
              ),
            ),
        ],
      ),
    );
  }
}