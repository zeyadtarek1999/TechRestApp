import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/Tech_rest_Components_model/Tech_rest_Components_model.dart';
import '../../shared/components/components.dart';
import '../Location/location_screen.dart';
import '../QR Screen/QR_code_instructions_screen.dart';

DatabaseService service = DatabaseService();
Future<List<OrderComponent>>? orderList;
List<OrderComponent>? retrievedorderList;
OrderComponent? component_model;

final GetOrderComponentRef = FirebaseFirestore.instance.collection('component');

class reservation_details extends StatefulWidget {
  reservation_details(
      {required this.table, required this.date, required this.time});

  final String table;
  final String date;
  final String time;

  @override
  State<reservation_details> createState() => _reservation_detailsState();
}

class _reservation_detailsState extends State<reservation_details> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () => Navigator.of(context).pop()),
        titleSpacing: 0.0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Reservation Details',
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      ),
      body:FutureBuilder(
        future: orderList,

        builder:(BuildContext context, AsyncSnapshot<List<OrderComponent>> snapshot){
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Restaurant Name:',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${retrievedorderList?[0].res_name ?? 'loading'} ",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Branch:',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${retrievedorderList?[0].res_name ?? 'loading'}, ${retrievedorderList?[0].restaurantLocation ?? 'loading'}",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 13,
                                    color: HexColor('#1C1C1C'),
                                    fontWeight: FontWeight.normal)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Phone:',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${retrievedorderList?[0].resphone ?? 'loading'}',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('${retrievedorderList?[0].open ?? 'loading'}',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(300)),
                          height: 190,
                          width: double.infinity,
                          child: Container(
                            decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(300)),
                            child: Image(
                              image: NetworkImage(
                                  '${retrievedorderList?[0].resimage ?? 'loading'}'),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.grey,
                        width: double.infinity,
                        height: 1,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text('Table Reserved',
                              style: GoogleFonts.metrophobic(
                                textStyle: TextStyle(fontSize: 18),
                                color: HexColor('#000000'),
                              )),
                          Spacer(),
                          Container(
                            height: 138,
                            width: 138,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurStyle: BlurStyle.normal,
                                    blurRadius: 3,
                                  )
                                ],
                                color: Colors.white),
                            child: Image(
                              image: AssetImage('${widget.table}'),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Day:',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Text('${widget.date}',style: GoogleFonts.cabin(
                                textStyle:
                                TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.normal)),),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Reservation Time:',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Text(
                              '${widget.time}',
                              style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 72,
                        width: 305,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.grey.shade300,
                        ),
                        child: Text(
                          "You will have 20 minutes extra on your reservation time if you were late but after that your reservation will be canceled so be careful for time ,we hope to see you :)",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.metrophobic(
                              textStyle:
                              TextStyle(color: HexColor('#707070'), fontSize: 12)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                          width: double.infinity,
                          height: 50,
                          function: () {
                            navigateTo(context, MapScreen());
                          },
                          text: 'Branch Direction',
                          write_text_color: Colors.white,
                          background: HexColor('#F0997A')),
                      SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                          width: double.infinity,
                          height: 50,
                          function: () {
                            navigateTo(context, QR_instructions());
                          },
                          text: 'Confirm Arrival',
                          write_text_color: Colors.white,
                          background: HexColor('#1B9740')),
                    ],
                  ),
                ),
              );


          }else if (snapshot.connectionState == ConnectionState.done &&
              retrievedorderList!.isEmpty){
            return Center(
              child: Text(
                'Empty, ',
                style: GoogleFonts.metrophobic(textStyle: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.w300,
                    color: Colors.black)),
              ),
            );

          }else {
            return Center(child: CircularProgressIndicator());
          }



        } ,
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
