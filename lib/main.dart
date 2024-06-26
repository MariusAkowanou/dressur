import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dressur/pages/authentification/firstePage.dart';
import 'package:dressur/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dressur',
      home: ScreenSplash(), // Affichez d'abord ScreenSplash
      debugShowCheckedModeBanner: false,
      routes:routes
    );
  }
}

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key});

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
      nextScreen: MyHomePage(),
      splashIconSize: 150,
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(milliseconds: 1000),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    checkLastPage(); // Vérifiez la dernière page visitée après le chargement de l'écran de chargement
  }

  Future<void> checkLastPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final String? lastPage = prefs.getString('lastPage');
    
    if (isLoggedIn) {
     if (lastPage != null) {
        // Si un dernier chemin de page est enregistré, naviguez vers ce chemin lastScreenIndex
       Navigator.pushNamed(context, lastPage);
        
      }else{
        Navigator.pushNamed(context, '/home');
      }
    } else {
      // Si l'utilisateur n'est pas connecté ou si aucun dernier chemin de page n'est enregistré, naviguez vers la page d'accueil
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FistView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Ne renvoie rien ici car nous n'avons pas besoin d'un widget sur cette page
  }
}

