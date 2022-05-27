import 'package:firstproject/Modules/register/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../shared/components/components.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../mainscreen.dart';

class afterBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#F5F1F1'),
        body: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 380,
                  decoration: BoxDecoration(
                      image: new DecorationImage(
                    image: new AssetImage(
                      'images/shape.png',
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 37,
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    //#4A4B4D
                    'Tech',
                    style: GoogleFonts.cabin(
                      textStyle: TextStyle(
                          color: HexColor('#A27CB1'),
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  width: 10,
                ),
                Text('Rest',
                    style: GoogleFonts.cabin(
                      textStyle: TextStyle(
                          color: HexColor('#4A4B4D'),
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text('MORE INDEPENDENCE.....MORE FREEDOM',
                style: GoogleFonts.metrophobic(
                  textStyle: TextStyle(
                      color: HexColor('#4A4B4D'),
                      fontSize: 11,
                      fontWeight: FontWeight.normal),
                )),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                  'Discover the best foods from over 1,000 restaurants, fast delivery to your doorstep, and reserve your own table in the restaurant',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.metrophobic(
                    textStyle: TextStyle(
                        color: HexColor('#4A4B4D'),
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 10, left: 10, top: 30, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  defaultButton(
                      width: double.infinity,
                      height: 50,
                      function: () {
                        navigateTo(
                          context,
                          mainscreen(),
                        );
                      },
                      text: 'Login',
                      write_text_color: Colors.white,
                      background: Colors.deepOrangeAccent.shade100),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.deepOrangeAccent.shade400, width: 0.9),
                    borderRadius: BorderRadius.circular(300)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    defaultButton(
                      width: double.infinity,
                      height: 50,
                      function: () {
                        navigateTo(
                          context,
                          register_screen(),
                        );
                      },
                      text: 'Create an account',
                      write_text_color: Colors.deepOrangeAccent.shade100,
                      background: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
