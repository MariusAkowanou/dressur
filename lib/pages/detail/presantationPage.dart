
import 'package:dressur/data/DataItemPresentation.dart';
import 'package:dressur/pages/HomePage.dart';
import 'package:dressur/widgets/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key});

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  final controller = DataItemPresentation();
  final pagecontroller = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
        child:isLastPage?getSartedbuild(context): Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // bouton de retour 
            TextButton(
              onPressed: (){
                pagecontroller.jumpToPage(controller.items.length-1);
              }, 
              child: Text('skip')
            ),
            //controleur de scroole de page 
           SmoothPageIndicator(
              controller:pagecontroller,
              count:controller.items.length,
              onDotClicked: (index){
                pagecontroller.animateToPage(                  
                  index,
                  duration:Duration(milliseconds: 600),
                  curve:Curves.easeIn, 
                );
              },
              effect:WormEffect(
                activeDotColor:Colors.blue, 
               dotHeight:12,
               dotWidth:12
              )
            ),

            //bouton vers la derniere page 
            TextButton(
              onPressed: (){
                pagecontroller.nextPage(
                  duration:Duration(milliseconds: 600) ,
                  curve:Curves.easeIn
                );
              }, 
              child: Text('next')
            )
          ],
        ),
      ),
      body:PageView.builder(
        onPageChanged: (index){
          setState(() {
            isLastPage = controller.items.length-1 == index;
          });
          
        },
        itemCount: controller.items.length,
        controller: pagecontroller,
        itemBuilder: (context,index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                height: MediaQuery.of(context).size.height/3,
                child:Image.asset(
                  controller.items[index].imagePath,
                  fit: BoxFit.cover,
                ) ,
              ),
              SizedBox(height: 15,),
              Text(
                controller.items[index].title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 15,),
              Text(
                  controller.items[index].description, 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:Colors.grey,
                    fontSize: 15,
                  ),
              ),
              
            ],
          );

        }
      ) ,
    );
  }
}

// get Satarted button

Widget getSartedbuild(BuildContext context){
  return Container(
    
    width: MediaQuery.of(context).size.width * .9,
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(8)
    ),
    child: TextButton(
      onPressed: (){
         Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => HomePage(),));
      }, 
      child: Text("Commencer",style: TextStyle(
        color: Colors.white
      ),)
    ),
  );
}