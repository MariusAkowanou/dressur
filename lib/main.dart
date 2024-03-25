import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dressur/pages/authentification/firstePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dressur',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return ScreenSplach() ;
  }
}


class ScreenSplach extends StatelessWidget {
  const ScreenSplach({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            'images/dressur_logo.png',
            width: 60,
            height: 60,
            ),
          Text(
            "Dressur",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          )
        ],
      ), 
      backgroundColor: Colors.blue,
      nextScreen: FistView(),
      splashIconSize: 150,
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(milliseconds: 1000),
    
    );
      
  }
}