import 'package:dressur/pages/HomePage.dart';
import 'package:dressur/pages/SettingPage.dart';
import 'package:dressur/pages/authentification/LoginPage.dart';
import 'package:dressur/pages/authentification/firstePage.dart';
import 'package:dressur/pages/authentification/sinUpPage.dart';
import 'package:dressur/pages/detail/setting/profilPage.dart';
import 'package:dressur/pages/detail/setting/validationPage.dart';
import 'package:dressur/pages/listContact.dart';
import 'package:dressur/pages/presantationPage.dart';
import 'package:dressur/pages/promoPage.dart';
import 'package:flutter/material.dart';

final Map<String,  WidgetBuilder> routes= {
  '/fistView': (context) => FistView(),
  '/home': (context) => HomePage(),
  '/login': (context) => LoginPage(),
  '/sinUp': (context) => SinUpPage(),
  '/setting': (context) => SettingPage(),
  '/listContact': (context) => ListContact(),
  '/promoPage': (context) => PromoPage(),
  '/profil': (context) => ProfilPage(),
  '/validation': (context) => ValidationPage(),
  '/presentation': (context) => PresentationPage(),
};