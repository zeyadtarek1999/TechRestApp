import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:firstproject/models/Tech_rest_Components_model/Tech_rest_Components_model.dart';
import '../Menu/menu_screen.dart';
import '../Review&Rate_screen/review_screen.dart';

DatabaseService service = DatabaseService();
Future<List<OrderComponent>>? orderList;
List<OrderComponent>? retrievedorderList;
OrderComponent? component_model;

final GetOrderComponentRef = FirebaseFirestore.instance.collection('component');

class mac_delivery_screen extends StatefulWidget {
  @override
  State<mac_delivery_screen> createState() => _mac_delivery_screenState();
}

class _mac_delivery_screenState extends State<mac_delivery_screen> {
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
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: FutureBuilder(
        future: orderList,
        builder: (BuildContext context,
            AsyncSnapshot<List<OrderComponent>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          image: new DecorationImage(
                        image: new AssetImage(
                          'images/mac_delivery_screen.png',
                        ),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Text(
                        "${retrievedorderList?[0].res_name ?? 'loading'}",
                        style: GoogleFonts.cabin(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${retrievedorderList?[0].open ?? 'loading'}',
                            style: GoogleFonts.metrophobic(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.deepOrange.shade400)),
                          ),
                          Spacer(),
                          Icon(Icons.star, color: HexColor('#F6C777')),
                          Text('${retrievedorderList?[0].rate ?? 'loading'}',
                              style: GoogleFonts.metrophobic(
                                textStyle: TextStyle(
                                    color: HexColor('#F6C777'),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      SizedBox(height: 80),
                      defaultButton(
                          width: double.infinity,
                          height: 50,
                          function: () {
                            navigateTo(context, menu());
                          },
                          text: 'Menu',
                          write_text_color: Colors.white,
                          background: Colors.deepOrangeAccent.shade100),
                      SizedBox(
                        height: 40,
                      ),

                      defaultButton(
                          width: double.infinity,
                          height: 50,
                          function: () {
                            navigateTo(context, review_screen());
                          },
                          text: 'Reviews',
                          write_text_color: Colors.white,
                          background: Colors.deepOrangeAccent.shade100),
                    ],
                  ),
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

  // addEmployee(OrderComponent order) async {
  //   await _db.collection("component").add(order.toMap());
  // }

// updateEmployee(OrderComponent employeeData) async {
//   await _db.collection("component").doc(employeeData.id).update(employeeData.toMap());
// }

  Future<void> deleteEmployee(String documentId) async {
    await _db.collection("component").doc(documentId).delete();
  }

  Future<List<OrderComponent>> retrievedorder() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("component").get();
    return snapshot.docs
        .map((docSnapshot) => OrderComponent.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
