import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/Tech_rest_Components_model/Tech_rest_Components_model.dart';
import '../order_components/dineinordercomponent.dart';

DatabaseService service = DatabaseService();
Future<List<OrderComponent>>? orderList;
List<OrderComponent>? retrievedorderList;
OrderComponent? component_model;
final GetOrderComponentRef = FirebaseFirestore.instance.collection('component');

class dineinmenu extends StatefulWidget {
  @override
  State<dineinmenu> createState() => _menuState();
}

class _menuState extends State<dineinmenu> {
  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    orderList = service.retrievedorder();
    retrievedorderList = await service.retrievedorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: orderList,
        builder: (BuildContext context,
            AsyncSnapshot<List<OrderComponent>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/backmenu.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: HexColor('#000000'),
                          )),
                      Text(
                        'Mc Donald\'s Menu',
                        style: GoogleFonts.metrophobic(
                            textStyle: TextStyle(
                                fontSize: 18,
                                color: HexColor('#000000'),
                                fontWeight: FontWeight.normal)),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 80, left: 17, right: 10),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      navigateTo(context, dineinorder_select());
                                    },
                                    child: Container(
                                      height: 180,
                                      width: 142,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  32)),
                                      child: Column(
                                        children: [
                                          Container(
                                              child: Image.network(
                                                  '${retrievedorderList?[0].orderImage ?? 'loading'}')),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${retrievedorderList?[0].orderName ?? 'loading'}',
                                            style: GoogleFonts.metrophobic(
                                                textStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: HexColor('#767676'),
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Container(
                                              child: Image.asset(
                                                  'images/rating.png')),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            '${retrievedorderList?[0].price.toString() ?? 'loading'} L.E',
                                            style: GoogleFonts.metrophobic(
                                                textStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: HexColor('#767676'),
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 80, left: 17, right: 10),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 180,
                                    width: 142,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                32)),
                                    child: Column(
                                      children: [
                                        Container(
                                            child: Image.asset(
                                                'images/chicken-mac.png')),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Chicken Mac',
                                          style: GoogleFonts.metrophobic(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: HexColor('#767676'),
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                            child: Image.asset(
                                                'images/chicken-mac_rate.png')),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          '90 L.E',
                                          style: GoogleFonts.metrophobic(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: HexColor('#767676'),
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 17, right: 10),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 180,
                                    width: 142,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                32)),
                                    child: Column(
                                      children: [
                                        Container(
                                            child: Image.asset(
                                                'images/mac_royal.png')),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Mac Royal',
                                          style: GoogleFonts.metrophobic(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: HexColor('#767676'),
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                            child: Image.asset(
                                                'images/rating.png')),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          '50 L.E',
                                          style: GoogleFonts.metrophobic(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: HexColor('#767676'),
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(left: 17, right: 10),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 180,
                                    width: 142,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                32)),
                                    child: Column(
                                      children: [
                                        Container(
                                            child: Image.asset(
                                                'images/chicken_fillet.png')),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Chicken Fillet',
                                          style: GoogleFonts.metrophobic(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: HexColor('#767676'),
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                            child: Image.asset(
                                                'images/chicken_fillet_rate.png')),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          '50 L.E',
                                          style: GoogleFonts.metrophobic(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: HexColor('#767676'),
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 17, right: 10),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 180,
                                    width: 142,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                32)),
                                    child: Column(
                                      children: [
                                        Container(
                                            child: Image.asset(
                                                'images/sunday.png')),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Chocolate Sunday',
                                          style: GoogleFonts.metrophobic(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: HexColor('#767676'),
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                            child: Image.asset(
                                                'images/rating.png')),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          '25 L.E',
                                          style: GoogleFonts.metrophobic(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: HexColor('#767676'),
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(left: 17, right: 10),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 180,
                                    width: 142,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                32)),
                                    child: Column(
                                      children: [
                                        Container(
                                            child: Image.asset(
                                                'images/mac_flurry_oreo.png')),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Mac Flurry Oreo',
                                          style: GoogleFonts.metrophobic(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: HexColor('#767676'),
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                            child: Image.asset(
                                                'images/chicken_fillet_rate.png')),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          '20 L.E',
                                          style: GoogleFonts.metrophobic(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: HexColor('#767676'),
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              retrievedorderList!.isEmpty) {
            return Center(
              child: Text(
                'Empty, ',
                style: GoogleFonts.metrophobic(
                    textStyle: TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.w300,
                        color: Colors.black)),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<OrderComponent>> retrievedorder() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("component").get();
    return snapshot.docs
        .map((docSnapshot) => OrderComponent.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
