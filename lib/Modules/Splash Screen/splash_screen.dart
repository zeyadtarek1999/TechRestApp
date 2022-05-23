import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firstproject/Modules/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';


class splash_screen extends StatelessWidget {

  final Techstyle =TextStyle(fontSize: 40, color:  HexColor("#A27CB1"),fontWeight:FontWeight.bold );
  final Reststyle =TextStyle(fontSize: 40, color: HexColor("#4A4B4D"),fontWeight:FontWeight.bold);
  final Sloganstyle =TextStyle(fontSize: 14, color: HexColor("#4A4B4D"),);

  @override
  Widget build(BuildContext context) {
     return AnimatedSplashScreen(
        centered: true,

        splash:
        Center(
          child: Column(

            children: [

              Image.asset('images/logo.png',height: 260,width: 260),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(' Tech',style: GoogleFonts.cabin (textStyle:Techstyle,),),
                  SizedBox(width: 10,),
                  Text('Rest',style: GoogleFonts.cabin (textStyle:Reststyle,),),
                ],
              ),
              SizedBox(height: 15,),
              Text('more independence.....more freedom'.toUpperCase(),style: GoogleFonts.metrophobic (textStyle:Sloganstyle,),)
            ],
          ),
        ),
        backgroundColor: Colors.white,
        splashIconSize: 400,
        duration: 2000,
        splashTransition:SplashTransition.fadeTransition ,
         pageTransitionType:PageTransitionType.topToBottom,
        animationDuration:const Duration(milliseconds: 1000 ),
        nextScreen: ON_Boarding_Screen(),
     );
  }
}
