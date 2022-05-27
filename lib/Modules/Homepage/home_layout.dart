import 'package:firstproject/Modules/Delivery%20Screens/delivery_homepage.dart';
import 'package:firstproject/Modules/Dine%20in%20Screens/dine_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class services extends StatelessWidget {
  final titleStyle = TextStyle(color: HexColor("#4A4B4D"));
  final deliveryStyle = TextStyle(color: HexColor("#4A4B4D"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Service ',
            style: GoogleFonts.metrophobic(
                textStyle: titleStyle, color: HexColor('#4A4B4D'))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'images/bar.png',
                      width: 97,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 40),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 87,
                            width: 280,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 4,
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            delivery_homepage()));
                              },
                              height: 87,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 90,
                                ),
                                child: Text('Delivery',
                                    style: GoogleFonts.roboto(
                                        textStyle: deliveryStyle,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 87,
                            width: 280,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 4,
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            dine_in_screen()));
                              },
                              height: 87,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 90,
                                ),
                                child: Text('Dine In',
                                    style: GoogleFonts.roboto(
                                        textStyle: deliveryStyle,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 43, horizontal: 14),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => delivery_homepage()));
                        },
                        child: Container(
                            width: 83,
                            height: 83,
                            child: Image.asset(
                              'images/coffee.png',
                              width: 83,
                              height: 83,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 170, horizontal: 19),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => dine_in_screen()));
                        },
                        child: Container(
                            width: 74,
                            height: 74,
                            child: Image.asset(
                              'images/res.png',
                              width: 74,
                              height: 74,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 290, top: 55),
                      child: FloatingActionButton.small(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => delivery_homepage()));
                        },
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_forward_ios,
                            size: 17, color: HexColor("#FC6011")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 290, top: 185),
                      child: FloatingActionButton.small(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => dine_in_screen()));
                        },
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_forward_ios,
                            size: 17, color: HexColor("#FC6011")),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
