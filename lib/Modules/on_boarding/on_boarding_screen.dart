import 'package:firstproject/Modules/after_boarding/after_board_screen.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
String buttontext = 'Next';
String skiptext = 'Skip';
class BoardingModel {
  late final String image;
  late final String title;
  late final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class ON_Boarding_Screen extends StatefulWidget {
  @override
  State<ON_Boarding_Screen> createState() => _ON_Boarding_ScreenState();
}

class _ON_Boarding_ScreenState extends State<ON_Boarding_Screen> {

  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'images/1.jpeg',
        title: 'Reserve Your Table',
        body: 'Find your table for any occasion'),
    BoardingModel(
        image: 'images/2.jpeg',
        title: 'Find Food You Love,',
        body:
            'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep '),
    BoardingModel(
        image: 'images/3.jpeg',
        title: 'Delivery On The Way',
        body: 'Fast food delivery to your home, office wherever you are'),
    BoardingModel(
        image: 'images/4.jpeg',
        title: 'Live Tracking',
        body:
            'Real time tracking of your food on the app once you placed the order')
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: boardController,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                        buttontext = 'Get Started';
                        skiptext = '';
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
                child: SmoothPageIndicator(
                    effect: ScrollingDotsEffect(
                      activeDotColor: Colors.deepOrangeAccent.shade100,
                      dotColor: Colors.white,
                      radius: 20,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                    controller: boardController,
                    count: boarding.length)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                    child: TextButton(
                        onPressed: () {
                          navigateAndFinish(context, afterBoardScreen());
                        },
                        child: Text(
                          skiptext,
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90, right: 10, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                defaultButton(
                    width: double.infinity,
                    height: 50,
                    function: () {

                      if (isLast) {

                        navigateAndFinish(context, afterBoardScreen());


                      } else {
                        boardController.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    text: buttontext,
                    write_text_color: Colors.white,
                    background: HexColor('#F0997A')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

login_screen() {}

Widget buildBoardingItem(BoardingModel model) => Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('${model.image}'), fit: BoxFit.cover),
          ), // Foreground widget here
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${model.title}',
                  style: GoogleFonts.metrophobic(
                    textStyle: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    '${model.body}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.metrophobic(
                        textStyle:
                            TextStyle(fontSize: 13, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
