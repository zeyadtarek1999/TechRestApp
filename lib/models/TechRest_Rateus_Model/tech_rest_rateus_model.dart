import 'package:cloud_firestore/cloud_firestore.dart';

class TechRestRateUsModel {
  late String ratetext;
  late String ratenumber;

  TechRestRateUsModel({
    required this.ratenumber,
    required this.ratetext,
  });

  TechRestRateUsModel.fromJason(Map<String, dynamic> json) {
    ratetext = json['ratetext'];
    ratenumber = json['ratenumber'];
  }

  Map<String, dynamic> toMap() {
    return {
      'ratetext': ratetext,
      'ratenumber': ratenumber,
    };
  }

  TechRestRateUsModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : ratetext = doc.data()!["ratetext"],
        ratenumber = doc.data()!["ratenumber"];
}
