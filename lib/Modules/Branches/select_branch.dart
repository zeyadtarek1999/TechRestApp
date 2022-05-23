import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Modules/Profile Screen/profile_screen.dart';
import '../../models/Tech_rest_Components_model/Tech_rest_Components_model.dart';
import '../Dine in Screens/table_design.dart';

DatabaseService service = DatabaseService();
Future<List<OrderComponent>>? orderList;
List<OrderComponent>? retrievedorderList;
OrderComponent? component_model;

final GetOrderComponentRef = FirebaseFirestore.instance.collection('component');


class selectbranch extends StatefulWidget {
  @override
  State<selectbranch> createState() => _selectbranchState();
}

class _selectbranchState extends State<selectbranch> {
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
        titleSpacing: 0.0,
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
        title: Row(
          children: [
            Text(
              'Select Branch',
              style: GoogleFonts.metrophobic(
                  textStyle: TextStyle(
                      color: HexColor('#4A4B4D'), fontWeight: FontWeight.bold)),
            ),


          ],
        ),
      ),
      body: FutureBuilder(
        future: orderList,

        builder:(BuildContext context, AsyncSnapshot<List<OrderComponent>> snapshot){
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        '${retrievedorderList?[0].res_name??'loading'}',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: HexColor('#1C1C1C'),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),


                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Branches',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: HexColor('#7936AB'),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 3,
                            width: 65,
                            color: HexColor('#7936AB'),
                          ),
                          Container(
                            height: 1,
                            width: 240,
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  buildBranchList(context),
                              separatorBuilder: (context, index) =>
                                  Divider(height: 2, color: Colors.grey[300]),
                              itemCount: 1)
                        ],
                      ),
                    ),
                  ),
                )
              ],
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

Widget buildBranchList(BuildContext context,) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${retrievedorderList?[0].restaurantLocation??'loading'}}',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: HexColor('#1C1C1C'),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                ' · ${retrievedorderList?[0].resphone??'loading'}',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: HexColor('#878484'),
                      fontSize: 11,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Text(
            '${retrievedorderList?[0].open??'loading'}',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: HexColor('#878484'),
                  fontSize: 11,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
      Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 9,
          ),

          Container(
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: HexColor('#F0997A'),
            ),
            child: MaterialButton(
              onPressed: () {
                navigateTo(context, table_design());

              },
              child: Text(
                'Select',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 9,
          )
        ],
      )
    ],
  );
}class DatabaseService {
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

