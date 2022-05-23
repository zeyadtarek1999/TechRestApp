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
          title:  FutureBuilder(future: userList,
            builder: (BuildContext context, AsyncSnapshot<List<TechRestUserModel>> snapshot){
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good morning, ${retrievedusersList?[0].name}' ,
                      style: GoogleFonts.metrophobic(textStyle: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.w300,
                          color: Colors.black)),
                    ),
                    Text(
                      'Dine In , ',
                      style: GoogleFonts.metrophobic(textStyle: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.w300,
                          color: Colors.black)),
                    ),
                  ],
                );

              }else if (snapshot.connectionState == ConnectionState.done &&
                  retrievedusersList!.isEmpty){
                return Text(
                  'loading, ',
                  style: GoogleFonts.metrophobic(textStyle: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.w300,
                      color: Colors.black)),
                );


              }else {
                return Center(child: CircularProgressIndicator());
              }


            },

          )),
      body:FutureBuilder(
        future: userList,
        builder:(BuildContext context, AsyncSnapshot<List<TechRestUserModel>> snapshot){
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Column(
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
                            itemCount: 1,
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 12,
                                childAspectRatio: 1,
                                mainAxisExtent: 120,
                                maxCrossAxisExtent: 150),
                            itemBuilder: (context, index) =>
                                gridbuild( context,)),
                      ],
                    ),
                  ),
                )
              ],
            );


          }else if (snapshot.connectionState == ConnectionState.done &&
              retrievedusersList!.isEmpty){
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

Widget gridbuild( BuildContext context, ) {
  return InkWell(
    onTap: () {
      navigateTo(context, selectbranch());
    },

    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 60,
            width: 60,
            child: Image.asset(
              'images/mac_logo1.png',
              fit: BoxFit.cover,
            )),
        Text(
          'Mac',
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
