import 'package:cloud_firestore/cloud_firestore.dart';

class TechRestUserModel {
  late String name;
  late String email;
  late String phone;
  late String address;
  late String uId;

  TechRestUserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
    required this.uId,
  });

  TechRestUserModel.fromJason(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'uId': uId,
    };
  }

  TechRestUserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!["name"],
        email = doc.data()!["email"],
        phone = doc.data()!["phone"],
        address = doc.data()!["address"],
        uId = doc.data()!["uId"];
}
