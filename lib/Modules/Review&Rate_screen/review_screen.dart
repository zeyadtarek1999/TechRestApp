import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/TechRest_Rateus_Model/tech_rest_rateus_model.dart';
import '../../models/Tech_rest_Components_model/Tech_rest_Components_model.dart';
import '../../models/Tech_rest_model/tech_rest_user_model.dart';
import 'package:hexcolor/hexcolor.dart';

DatabaseService3 service3 = DatabaseService3();
Future<List<TechRestUserModel>>? userlist;
List<TechRestUserModel>? retrieveduserList;
TechRestUserModel? user_model;
final GetUsersRef = FirebaseFirestore.instance.collection('users');

DatabaseService service = DatabaseService();
Future<List<OrderComponent>>? orderList;
List<OrderComponent>? retrievedorderList;
OrderComponent? component_model;

final GetOrderComponentRef = FirebaseFirestore.instance.collection('component');

DatabaseService2 service2 = DatabaseService2();
Future<List<TechRestRateUsModel>>? RateList;
List<TechRestRateUsModel>? retrievedrateList;
TechRestRateUsModel? rate_model;

final GetRateRef = FirebaseFirestore.instance.collection('Rate');

class review_screen extends StatefulWidget {
  const review_screen({Key? key}) : super(key: key);

  @override
  State<review_screen> createState() => _review_screenState();
}

class _review_screenState extends State<review_screen> {
  @override
  void initState() {
    super.initState();
    profileDet();
    ratedet();
    orderdet();
  }

  Future<void> profileDet() async {
    userlist = service3.retrieveduser();
    retrieveduserList = await service3.retrieveduser();
  }

  Future<void> ratedet() async {
    RateList = service2.retrievedrate();
    retrievedrateList = await service2.retrievedrate();
  }

  Future<void> orderdet() async {
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
        centerTitle: true,
        title: Text(
          'Review',
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: FutureBuilder(
              future: orderList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<OrderComponent>> snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Row(
                    children: [
                      Spacer(),
                      CircleAvatar(
                        radius: 47,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage('${retrievedorderList?[0].Maclogo}'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "${retrievedorderList?[0].res_name}",
                        style: TextStyle(fontSize: 24, color: HexColor('#6f7571')),
                      ),
                      Spacer(
                        flex: 2,
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
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            height: 3,
            width: double.infinity,
            color: Colors.grey[200],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                FutureBuilder(
                  future: userlist,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<TechRestUserModel>> snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Text('${retrieveduserList?[0].name}',style: TextStyle(fontSize: 18,color: Colors.black),);
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
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
                Spacer(),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
                SizedBox(
                  width: 5,
                ),
                FutureBuilder(
                  future: RateList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<TechRestRateUsModel>> snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Text('${retrievedrateList?[0].ratenumber}',style: TextStyle(fontSize: 15),);
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
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
              ],
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Row(
            children: [
              Spacer(),
              Text(
                'Comment',
                style: TextStyle(fontSize: 16),
              ),
              Spacer()
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(24),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 3,
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: FutureBuilder(
                  future: RateList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<TechRestRateUsModel>> snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Text('${retrievedrateList?[0].ratetext} ');
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
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
              ),
            ),
          )
        ],
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

class DatabaseService2 {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // addEmployee(OrderComponent order) async {
  //   await _db.collection("component").add(order.toMap());
  // }

// updateEmployee(OrderComponent employeeData) async {
//   await _db.collection("component").doc(employeeData.id).update(employeeData.toMap());
// }

  Future<void> deleteEmployee(String documentId) async {
    await _db.collection("Rate").doc(documentId).delete();
  }

  Future<List<TechRestRateUsModel>> retrievedrate() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Rate").get();
    return snapshot.docs
        .map((docSnapshot) =>
            TechRestRateUsModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}

class DatabaseService3 {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // addEmployee(OrderComponent order) async {
  //   await _db.collection("component").add(order.toMap());
  // }

// updateEmployee(OrderComponent employeeData) async {
//   await _db.collection("component").doc(employeeData.id).update(employeeData.toMap());
// }

  Future<void> deleteEmployee(String documentId) async {
    await _db.collection("users").doc(documentId).delete();
  }

  Future<List<TechRestUserModel>> retrieveduser() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("users").get();
    return snapshot.docs
        .map((docSnapshot) =>
            TechRestUserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
