import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/Tech_rest_Components_model/Tech_rest_Components_model.dart';
import '../order_components/dineinordercomponent.dart';
import '../order_components/order_components.dart';

DatabaseService service = DatabaseService();
Future<List<OrderComponent>>? orderList;
List<OrderComponent>? retrievedorderList;
OrderComponent? component_model;
final GetOrderComponentRef = FirebaseFirestore.instance.collection('component');


class menucomponent {
  String image;

  String foodname;

  String ratingimage;

  String price;

  menucomponent(this.image,
      this.foodname,
      this.ratingimage,
      this.price,);
}

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

  List <menucomponent> components = [
    menucomponent('${retrievedorderList?[0].orderImage ?? 'loading'}',
        '${retrievedorderList?[0].orderName ?? 'loading'}', 'images/rating.png',
        '${retrievedorderList?[0].price.toString()??'loading'}'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
            child: Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                },
                    icon: Icon(
                      Icons.arrow_back_ios, color: HexColor('#000000'),)),
                Text('Mc Donald\'s Menu',
                  style: GoogleFonts.metrophobic(
                      textStyle: TextStyle(
                          fontSize: 18,
                          color: HexColor('#000000'),
                          fontWeight: FontWeight.normal)),
                ),

              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
              child:
              Expanded(
                child: SingleChildScrollView(physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GridView.builder(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: components.length,
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              crossAxisSpacing: 40,
                              mainAxisSpacing: 28,
                              childAspectRatio: 1,
                              mainAxisExtent: 170,
                              maxCrossAxisExtent: 140),
                          itemBuilder: (context, index) =>
                              Buildmenugrid(components[index],context)),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

Widget Buildmenugrid(menucomponent component,BuildContext context,) {
  return InkWell(onTap: (){

    navigateTo(context, dineinorder_select());

  },
    child: Container(
      height: 160,
      width: 142,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(32)),
      child: Column(
        children: [
          Container(child: Image.network('${component.image}')),
          SizedBox(height: 5,),
          Text('${component.foodname}',
            style: GoogleFonts.metrophobic(
                textStyle: TextStyle(
                    fontSize: 15,
                    color: HexColor('#767676'), fontWeight: FontWeight.normal)),
          ),
          SizedBox(height: 7,),
          Container(child: Image.asset('${component.ratingimage}')),
          SizedBox(height: 7,),
          Text('${component.price} L.E',
            style: GoogleFonts.metrophobic(
                textStyle: TextStyle(
                    fontSize: 15,
                    color: HexColor('#767676'), fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    ),
  );
}

class DatabaseService  {
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
