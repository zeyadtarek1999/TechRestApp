import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../models/Tech_rest_model/tech_rest_user_model.dart';
import '../../shared/components/components.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Branches/select_branch.dart';

DatabaseService service = DatabaseService();
Future<List<TechRestUserModel>>? userList;
List<TechRestUserModel>? retrievedusersList;
TechRestUserModel? usermodel;

final GetTechRestUserModelRef = FirebaseFirestore.instance.collection('users');

class gridbuildrestaurant {
  late String image;
  late String resname;

  gridbuildrestaurant({
    required this.image,
    required this.resname,
  });
}

class dine_in_screen extends StatefulWidget {
  @override
  State<dine_in_screen> createState() => _dine_in_screenState();
}

class _dine_in_screenState extends State<dine_in_screen> {
  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    userList = service.retrievedusers();
    retrievedusersList = await service.retrievedusers();
  }

  var search_Controller = TextEditingController();

  List<gridbuildrestaurant> components = [
    gridbuildrestaurant(image: 'images/mac_logo1.png', resname: 'Mac'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          shadowColor: Colors.grey,
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
          titleSpacing: 2,
          leadingWidth: 54,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Text(
                    'Good morning',
                    style: TextStyle(color: HexColor('#4A4B4D')),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '${retrievedusersList?[0].name ?? 'loading'}',
                    style: TextStyle(color: HexColor('#4A4B4D')),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '!',
                    style: TextStyle(color: HexColor('#4A4B4D')),
                  ),
                ],
              ),
              Text(
                'Dine in ,',
                style: TextStyle(color: HexColor('#4A4B4D')),
              ),
            ],
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: components.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1,
                          mainAxisExtent: 120,
                          maxCrossAxisExtent: 150),
                      itemBuilder: (context, index) =>
                          gridbuild(components[index] ,context,)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget gridbuild(gridbuildrestaurant component , BuildContext context, ) {
  return InkWell(
    onTap: () {
      if (component.resname=='Mac') {
        navigateTo(context, selectbranch());
      }
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 60,
            width: 60,
            child: Image.asset(
              '${component.image}',
              fit: BoxFit.cover,
            )),
        Text(
          '${component.resname}',
          style: GoogleFonts.metrophobic(
              textStyle: TextStyle(
                  color: HexColor('#4A4B4D'),
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
        ),
      ],
    ),
  );
}

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // addEmployee(TechRestUserModel order) async {
  //   await _db.collection("component").add(order.toMap());
  // }

// updateEmployee(TechRestUserModel employeeData) async {
//   await _db.collection("component").doc(employeeData.id).update(employeeData.toMap());
// }

  Future<void> deleteEmployee(String documentId) async {
    await _db.collection("users").doc(documentId).delete();
  }

  Future<List<TechRestUserModel>> retrievedusers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("users").get();
    return snapshot.docs
        .map((docSnapshot) =>
            TechRestUserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
