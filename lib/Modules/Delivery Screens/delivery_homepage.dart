import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import '../../models/Tech_rest_model/tech_rest_user_model.dart';
import 'mac_delivery_screen.dart';
import 'package:google_fonts/google_fonts.dart';

DatabaseService service = DatabaseService();
Future<List<TechRestUserModel>>? userList;
List<TechRestUserModel>? retrievedusersList;
TechRestUserModel? usermodel;

final GetTechRestUserModelRef = FirebaseFirestore.instance.collection('users');

class rest_delivery_components {
  late String rate;
  late String background;
  late String name;
  late String logo;

  rest_delivery_components({
    required this.rate,
    required this.background,
    required this.name,
    required this.logo,
  });
}

var search_Controller = TextEditingController();

class delivery_homepage extends StatefulWidget {
  @override
  State<delivery_homepage> createState() => _delivery_homepageState();
}

class _delivery_homepageState extends State<delivery_homepage> {
  @override
  void initState() {
    super.initState();

    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    userList = service.retrievedusers();
    retrievedusersList = await service.retrievedusers();
  }

  List<rest_delivery_components> delivery = [
    rest_delivery_components(
        rate: '4.6',
        background: 'images/mac_background.png',
        name: "MacDonald's",
        logo: 'images/mac_logo1.png'),
    rest_delivery_components(
        rate: '4.5',
        background: 'images/spectra_background.png',
        name: "Spectra",
        logo: 'images/spectra_logo.png'),
    rest_delivery_components(
        rate: '4.8',
        background: 'images/buffalo_background.png',
        name: "Buffalo Burger",
        logo: 'images/buffalo_logo.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            titleSpacing: 0.0,
            backgroundColor: Colors.white,
            elevation: 0,
            title: FutureBuilder(
              future: userList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<TechRestUserModel>> snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Text(
                    'Good morning, ${retrievedusersList?[0].name ?? 'loading'}',
                    style: GoogleFonts.metrophobic(
                        textStyle: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.w300,
                            color: Colors.black)),
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    retrievedusersList!.isEmpty) {
                  return Text(
                    'loading, ',
                    style: GoogleFonts.metrophobic(
                        textStyle: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.w300,
                            color: Colors.black)),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )),
        body: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      resturant_components(delivery[index], context, index),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 14,
                      ),
                  itemCount: delivery.length),
            ),
          ],
        ));
  }
}

Widget resturant_components(
        rest_delivery_components delivery, BuildContext context, index) =>
    InkWell(
      onTap: () {
        if (delivery.name == "MacDonald's") {
          navigateTo(context, mac_delivery_screen());
        }
      },
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              child: Image(
                image: AssetImage('${delivery.background}'),
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 135, left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                ),
                Text(
                  '${delivery.rate}',
                  style: TextStyle(color: Colors.amberAccent),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '${delivery.name}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                    child: Image(
                  image: AssetImage('${delivery.logo}'),
                )),
              ],
            ),
          )
        ],
      ),
    );

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<TechRestUserModel>> retrievedusers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("users").get();
    return snapshot.docs
        .map((docSnapshot) =>
            TechRestUserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
