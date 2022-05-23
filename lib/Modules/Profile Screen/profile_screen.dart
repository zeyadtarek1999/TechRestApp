import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/Tech_rest_model/tech_rest_user_model.dart';


DatabaseService service = DatabaseService();
Future<List<TechRestUserModel>>? userlist;
List<TechRestUserModel>? retrieveduserList;
TechRestUserModel? user_model;
final GetOrderComponentRef = FirebaseFirestore.instance.collection('users');
class profile_details extends StatefulWidget {
  @override
  State<profile_details> createState() => _profile_detailsState();
}

class _profile_detailsState extends State<profile_details> {
  @override
  void initState() {
    super.initState();
    profileDet();
  }
  Future<void> profileDet() async {
    userlist = service.retrieveduser();
    retrieveduserList = await service.retrieveduser();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      body:FutureBuilder(
        future: userlist,

        builder:(BuildContext context, AsyncSnapshot<List<TechRestUserModel>> snapshot){
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  children: [
                    Center(
                      child: Container(

                        child: CircleAvatar(

                          backgroundImage: NetworkImage('https://cdn.shopify.com/s/files/1/0035/2754/0782/articles/International_Flower_Day_1200x1200.jpeg?v=1579365491'),
                          backgroundColor: Colors.grey.shade300,
                          radius: 90,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(children: [
                          Text(
                            'Name:',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Spacer(),
                          Text('${retrieveduserList?[0].name??'loading'}')
                        ]),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(children: [
                          Text(
                            'Email:',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Spacer(),
                          Text('${retrieveduserList?[0].email??'loading'}')
                        ]),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(children: [
                          Text(
                            'phone:',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Spacer(),
                          Text('${retrieveduserList?[0].phone??'loading'}')
                        ]),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(children: [
                          Text(
                            'Country/Area:',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Spacer(),
                          Text('${retrieveduserList?[0].address??'loading'}')
                        ]),
                      ),
                    ),
                    SizedBox(height: 50),
                  ]),
            );


          }else if (snapshot.connectionState == ConnectionState.done &&
              retrieveduserList!.isEmpty){
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
    await _db.collection("users").doc(documentId).delete();
  }

  Future<List<TechRestUserModel>> retrieveduser() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("users").get();
    return snapshot.docs
        .map((docSnapshot) => TechRestUserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
