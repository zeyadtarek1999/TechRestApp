import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/Tech_rest_Components_model/Tech_rest_Components_model.dart';
import '../Checkout Screen/dineincheckout_screen.dart';

DatabaseService service = DatabaseService();
Future<List<OrderComponent>>? orderList;
List<OrderComponent>? retrievedorderList;
OrderComponent? component_model;

final GetOrderComponentRef = FirebaseFirestore.instance.collection('component');

int lettucequantity = 0;
int BeefBurgerquantity = 0;
int picklesquantity = 0;
int cheesequantity = 0;
int onionsquantity = 0;
int tomatoquantity = 0;
int TastySaucequantity = 0;
int Quantity = 1;

class dineinorder_select extends StatefulWidget {
  @override
  State<dineinorder_select> createState() => _order_selectState();
}

class _order_selectState extends State<dineinorder_select> {
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
    dynamic balance = retrievedorderList?[0].price;

    dynamic lettuceprice = retrievedorderList?[0].lettuce;

    if (lettuceprice != null && lettucequantity != null) {
      lettuceprice = lettuceprice * lettucequantity;
    }
    dynamic beefBurgerprice = retrievedorderList?[0].beefBurger;
    if (beefBurgerprice != null) {
      beefBurgerprice = beefBurgerprice * BeefBurgerquantity;
    }
    dynamic picklesprice = retrievedorderList?[0].pickles;
    if (picklesprice != null) {
      picklesprice = picklesprice * picklesquantity;
    }
    dynamic cheeseprice = retrievedorderList?[0].cheese;
    if (cheeseprice != null) {
      cheeseprice = cheeseprice * cheesequantity;
    }
    dynamic onionprice = retrievedorderList?[0].onion;
    if (onionprice != null) {
      onionprice = onionprice * onionsquantity;
    }
    dynamic tomatoprice = retrievedorderList?[0].tomato;
    if (tomatoprice != null) {
      tomatoprice = tomatoprice * tomatoquantity;
    }
    dynamic tastySauceprice = retrievedorderList?[0].tastySauce;
    if (tastySauceprice != null) {
      tastySauceprice = tastySauceprice * TastySaucequantity;
    }

    if (balance != null) {
      balance = (balance +
              lettuceprice +
              beefBurgerprice +
              picklesprice +
              cheeseprice +
              onionprice +
              tomatoprice +
              tastySauceprice) *
          Quantity;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: orderList,
        builder: (BuildContext context,
            AsyncSnapshot<List<OrderComponent>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.center,
                        height: 320,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/backmenu.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                                alignment: AlignmentDirectional.center,
                                child: CircleAvatar(
                                    radius: 100,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 26, left: 7),
                                      child: Image.network(
                                          '${retrievedorderList?[0].orderImage.toString() ?? 'loading'}'),
                                    ))),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 180),
                              child: Text(
                                  '${retrievedorderList?[0].orderName.toString() ?? 'loading'}')),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 220, left: 20),
                        child: Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurStyle: BlurStyle.normal,
                                    blurRadius: 4,
                                  )
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6, left: 10),
                              child: Text('Basics'),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 255, left: 10),
                        child: Container(
                            width: 230,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurStyle: BlurStyle.normal,
                                    blurRadius: 4,
                                  )
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 7),
                              child: Text(
                                '${retrievedorderList?[0].bigtastycomponents.toString() ?? 'loading'}',
                                style: TextStyle(
                                    color: HexColor('#656565'), fontSize: 12),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 280, left: 290),
                        child: Container(
                          width: 55,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 4,
                                )
                              ],
                              color: Colors.white),
                          child: Text(
                              '${retrievedorderList?[0].price ?? 'loading'} L.E'),
                          alignment: Alignment.center,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Extra'),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 220,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 4,
                                )
                              ],
                              color: Colors.white),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 3),
                                  child: Row(
                                    children: [
                                      Text('Lettuce'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${retrievedorderList?[0].lettuce ?? 'loading'} L.E',
                                        style: TextStyle(
                                            color: HexColor('#FC6011')),
                                      ),
                                      Spacer(),
                                      FloatingActionButton(
                                          backgroundColor: HexColor('#F0997A'),
                                          onPressed: () {
                                            setState(() {
                                              if (lettucequantity > 0) {
                                                lettucequantity--;
                                              } else {
                                                lettucequantity = 0;
                                              }
                                            });
                                          },
                                          child: Text('-'),
                                          mini: true),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('${lettucequantity}'),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: HexColor('#F0997A'),
                                        onPressed: () {
                                          setState(() {
                                            lettucequantity++;
                                          });
                                        },
                                        child: Text('+'),
                                        mini: true,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 3),
                                  child: Row(
                                    children: [
                                      Text('Beef Burger'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${retrievedorderList?[0].beefBurger ?? 'loading'} L.E',
                                          style: TextStyle(
                                              color: HexColor('#FC6011'))),
                                      Spacer(),
                                      FloatingActionButton(
                                          backgroundColor: HexColor('#F0997A'),
                                          onPressed: () {
                                            setState(() {
                                              if (BeefBurgerquantity > 0) {
                                                BeefBurgerquantity--;
                                              } else {
                                                BeefBurgerquantity = 0;
                                              }
                                            });
                                          },
                                          child: Text('-'),
                                          mini: true),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('${BeefBurgerquantity}'),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: HexColor('#F0997A'),
                                        onPressed: () {
                                          setState(() {
                                            BeefBurgerquantity++;
                                          });
                                        },
                                        child: Text('+'),
                                        mini: true,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 3),
                                  child: Row(
                                    children: [
                                      Text('Pickles'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${retrievedorderList?[0].pickles ?? 'loading'} L.E',
                                          style: TextStyle(
                                              color: HexColor('#FC6011'))),
                                      Spacer(),
                                      FloatingActionButton(
                                          backgroundColor: HexColor('#F0997A'),
                                          onPressed: () {
                                            setState(() {
                                              if (picklesquantity > 0) {
                                                picklesquantity--;
                                              } else {
                                                picklesquantity = 0;
                                              }
                                            });
                                          },
                                          child: Text('-'),
                                          mini: true),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('${picklesquantity}'),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: HexColor('#F0997A'),
                                        onPressed: () {
                                          setState(() {
                                            picklesquantity++;
                                          });
                                        },
                                        child: Text('+'),
                                        mini: true,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 3),
                                  child: Row(
                                    children: [
                                      Text('Cheese'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${retrievedorderList?[0].cheese ?? 'loading'} L.E',
                                          style: TextStyle(
                                              color: HexColor('#FC6011'))),
                                      Spacer(),
                                      FloatingActionButton(
                                          backgroundColor: HexColor('#F0997A'),
                                          onPressed: () {
                                            setState(() {
                                              if (cheesequantity > 0) {
                                                cheesequantity--;
                                              } else {
                                                cheesequantity = 0;
                                              }
                                            });
                                          },
                                          child: Text('-'),
                                          mini: true),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('${cheesequantity}'),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: HexColor('#F0997A'),
                                        onPressed: () {
                                          setState(() {
                                            cheesequantity++;
                                          });
                                        },
                                        child: Text('+'),
                                        mini: true,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 3),
                                  child: Row(
                                    children: [
                                      Text('Onions'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${retrievedorderList?[0].onion ?? 'loading'} L.E',
                                          style: TextStyle(
                                              color: HexColor('#FC6011'))),
                                      Spacer(),
                                      FloatingActionButton(
                                          backgroundColor: HexColor('#F0997A'),
                                          onPressed: () {
                                            setState(() {
                                              if (onionsquantity > 0) {
                                                onionsquantity--;
                                              } else {
                                                onionsquantity = 0;
                                              }
                                            });
                                          },
                                          child: Text('-'),
                                          mini: true),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('${onionsquantity}'),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: HexColor('#F0997A'),
                                        onPressed: () {
                                          setState(() {
                                            onionsquantity++;
                                          });
                                        },
                                        child: Text('+'),
                                        mini: true,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 3),
                                  child: Row(
                                    children: [
                                      Text('Tomato '),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${retrievedorderList?[0].tomato ?? 'loading'} L.E',
                                          style: TextStyle(
                                              color: HexColor('#FC6011'))),
                                      Spacer(),
                                      FloatingActionButton(
                                          backgroundColor: HexColor('#F0997A'),
                                          onPressed: () {
                                            setState(() {
                                              if (tomatoquantity > 0) {
                                                tomatoquantity--;
                                              } else {
                                                tomatoquantity = 0;
                                              }
                                            });
                                          },
                                          child: Text('-'),
                                          mini: true),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('${tomatoquantity}'),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: HexColor('#F0997A'),
                                        onPressed: () {
                                          setState(() {
                                            tomatoquantity++;
                                          });
                                        },
                                        child: Text('+'),
                                        mini: true,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 3),
                                  child: Row(
                                    children: [
                                      Text('Tasty Sauce '),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${retrievedorderList?[0].tastySauce ?? 'loading'} L.E',
                                          style: TextStyle(
                                              color: HexColor('#FC6011'))),
                                      Spacer(),
                                      FloatingActionButton(
                                          backgroundColor: HexColor('#F0997A'),
                                          onPressed: () {
                                            setState(() {
                                              if (TastySaucequantity > 0) {
                                                TastySaucequantity--;
                                              } else {
                                                TastySaucequantity = 0;
                                              }
                                            });
                                          },
                                          child: Text('-'),
                                          mini: true),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('${TastySaucequantity}'),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: HexColor('#F0997A'),
                                        onPressed: () {
                                          setState(() {
                                            TastySaucequantity++;
                                          });
                                        },
                                        child: Text('+'),
                                        mini: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: double.infinity,
                          height: 94,
                          decoration: BoxDecoration(
                              color: HexColor('#EDF0FF'),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Text('Quantity'),
                                    Spacer(),
                                    FloatingActionButton(
                                        backgroundColor: HexColor('#FFFFFF'),
                                        onPressed: () {
                                          setState(() {
                                            if (Quantity > 1) {
                                              Quantity--;
                                            } else {
                                              Quantity = 1;
                                            }
                                          });
                                        },
                                        child: Text('-',
                                            style: TextStyle(
                                                color: HexColor('#7A428F'))),
                                        mini: true),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text('${Quantity}',
                                        style: TextStyle(
                                            color: HexColor('#656565'))),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    FloatingActionButton(
                                      backgroundColor: HexColor('#FFFFFF'),
                                      onPressed: () {
                                        setState(() {
                                          Quantity++;
                                        });
                                      },
                                      child: Text('+',
                                          style: TextStyle(
                                              color: HexColor('#7A428F'))),
                                      mini: true,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Row(
                                  children: [
                                    Text('Balance Amount'),
                                    Spacer(
                                      flex: 2,
                                    ),
                                    SizedBox(
                                      width: 34,
                                    ),
                                    Text('${balance ?? '80'}',
                                        style: TextStyle(
                                            color: HexColor('#656565'))),
                                    Spacer(
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Container(
                                height: 42,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(16),
                                  color: HexColor('#F0997A'),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    navigateTo(
                                        context,
                                        dineincheckout_screen(
                                          subTotal: '${balance ?? '80'}',
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        'Confirm',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )),
                            Spacer(),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
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
