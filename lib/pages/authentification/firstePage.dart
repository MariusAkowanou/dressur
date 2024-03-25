import 'package:dressur/pages/HomePage.dart';
import 'package:dressur/pages/authentification/sinUpPage.dart';
import 'package:dressur/pages/authentification/LoginPage.dart';
import 'package:flutter/material.dart';

class FistView extends StatefulWidget {
  const FistView({Key? key}) : super(key: key);

  @override
  State<FistView> createState() => _FistViewState();
}

class _FistViewState extends State<FistView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      color: Color(0xFF2196F3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(
                "images/dressur_logo.png" ,
                width: 50,
                height: 50,
              ),
              Text(
                'DRESSUR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ],
          ),
          Container(
            
            padding: EdgeInsets.only(top: 12,),
            height: 150,
            width: width * .9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              children: [
                Text(
                  "S'INSCRIRE OU SE CONNECTER",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                /*--------------------------------------*/
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton.icon(
                      onPressed: () {
                        
                              Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => HomePage()));
                      },
                      icon: Icon(
                        Icons.android_sharp,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Google',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                /*------------------------------------------------*/
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 237, 237),
                            borderRadius: BorderRadius.circular(7),
                            
                          ),
                            
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => LoginPage()));
                            }, 
                            child: Text("Se connecté", style: TextStyle(color: Colors.black),)
                          )
                        ),
                       Container(
                        width: MediaQuery.of(context).size.width * .4,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 237, 237),
                            borderRadius: BorderRadius.circular(7)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => SinUpPage(),));
                            }, 
                            child: Text(
                              "S'inscrire",
                              style: TextStyle(color: Colors.black))
                          )
                        ),
                   
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
