import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class aboutus extends StatelessWidget {
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
          'About Us',
          style: GoogleFonts.metrophobic(
              textStyle: TextStyle(
                  color: HexColor('#4A4B4D'), fontWeight: FontWeight.bold)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: HexColor('#F0997A'),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          'Despite of having many applications that help us in daily tasks and whatever we need our daily life, we need to develop more applications or to upgrade the current application to make themmore easy and more broad technology to facilitate our life, so we made an application thatfacilitate reservation for any restaurant as our problem was for the listing of the customers. Moreand more customers will do everything online. The same is true for table reservations as theycan be reserved from anyplace. The best way to cope with an overflowing reservations list, tofacilitate the right decisions at the right time and improvisations, their first impression of theapplication will predispose them to the rest of the experience.',style: GoogleFonts.metrophobic(
                          textStyle: TextStyle(
                              color: HexColor('#4A4B4D'), fontWeight: FontWeight.normal)))
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Spacer(),
              Text('Made by', style: GoogleFonts.dancingScript(
                  textStyle:TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold))),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 45,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: HexColor('#F0997A'),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: HexColor('#F0997A'),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: HexColor('#F0997A'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('Arwa Mostafa',
                    style: GoogleFonts.metrophobic(
                        textStyle: TextStyle(
                            color: HexColor('#4A4B4D'), fontWeight: FontWeight.bold))),Spacer(),
                Text('Mahmoud Samir',
                    style: GoogleFonts.metrophobic(
                        textStyle: TextStyle(
                            color: HexColor('#4A4B4D'), fontWeight: FontWeight.bold))),Spacer(),
                Text('Zeyad Tarek',
                    style: GoogleFonts.metrophobic(
                        textStyle: TextStyle(
                            color: HexColor('#4A4B4D'), fontWeight: FontWeight.bold)))
              ],
            ),
          )
        ],
      ),
    );
  }
}