import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class change_language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: HexColor('#4A4B4D'),
            )),
        title: Text(
          'Change Language',
          style: GoogleFonts.metrophobic(
              textStyle: TextStyle(
                  color: HexColor('#4A4B4D'), fontWeight: FontWeight.bold)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurStyle: BlurStyle.normal,
                    blurRadius: 4,
                  )
                ],
              ),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 17,
                    ),
                    Spacer(),
                    Text('English'),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              height: 50,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurStyle: BlurStyle.normal,
                    blurRadius: 4,
                  )
                ],
              ),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 17,
                    ),
                    Spacer(),
                    Text('Arabic'),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
