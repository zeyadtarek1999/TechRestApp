import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class natifcationcomponent {
  String component;

  String time;

  natifcationcomponent({
    required this.component,
    required this.time,
  });
}

class notification_screen extends StatelessWidget {
  List<natifcationcomponent> noticication = [
    natifcationcomponent(
      time: '1 min',
      component: 'Your order has placed',
    ),natifcationcomponent(
      time: 'now',
      component: 'Your order has been delivered',
    ),


    natifcationcomponent(
      time: 'now',
      component: 'Thank you for your review ',
    ),

  ];

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
            'Notifications',
            style: GoogleFonts.metrophobic(
                textStyle: TextStyle(
                    color: HexColor('#4A4B4D'), fontWeight: FontWeight.bold)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: noticication.length,
            itemBuilder: (context, index) => notificationBuilder(noticication[index]),
            separatorBuilder: (context, index) => Container(
              height: 1,
              color: Colors.grey[200],
            ),
          ),
        ));
  }
}

Widget notificationBuilder(natifcationcomponent components) => Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    CircleAvatar(
      radius: 5,
      backgroundColor: HexColor('#F0997A'),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${components.component}',
            style: GoogleFonts.metrophobic(
                textStyle: TextStyle(
                    fontSize: 14,
                    color: HexColor('#4A4B4D'),
                    fontWeight: FontWeight.normal)),
          ),
          Text(
            '${components.time}',
            style: GoogleFonts.metrophobic(
                textStyle: TextStyle(
                    fontSize: 12,
                    color: HexColor('#B6B7B7'),
                    fontWeight: FontWeight.normal)),
          ),
          SizedBox(height: 17,)
        ],
      ),
    )
  ],
);