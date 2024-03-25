import 'package:dressur/pages/SettingPage.dart';
import 'package:dressur/pages/actualyPage.dart';
import 'package:dressur/pages/listContact.dart';
import 'package:dressur/pages/promoPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
 const HomePage({Key? key}) : super(key: key);

 @override
 State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int _currentIndex = 0;
 final Screens = [
    ActualityPage(),
    PromoPage(),
    ListContact(),
    SettingPage()
 ]; 

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        height: 70,
        elevation: 4,
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Accueil'),
          NavigationDestination(icon: Icon(Icons.bar_chart_outlined), label: 'Promo'),
          NavigationDestination(icon: Icon(Icons.assignment), label: 'Contact'),
          NavigationDestination(icon: Icon(Icons.account_circle), label: 'Compte')
        ],
        
    ));
 }
}
