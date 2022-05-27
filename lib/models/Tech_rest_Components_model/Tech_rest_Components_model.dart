import 'package:cloud_firestore/cloud_firestore.dart';

class OrderComponent {
  late String restaurantName;
  late String orderImage;
  late double orderRate;
  late String orderName;
  late String restaurantLocation;
  late int lettuce;
  late int resphone;
  late int beefBurger;
  late int pickles;
  late int cheese;
  late int tomato;
  late int tastySauce;
  late int onion;
  late int price;
  late int Fries;
  late int Pepsi;
  late String bigtastycomponents;
  late String res_name;
  late String resimage;
  late String open;
  late String rate;
  late String Maclogo;

  OrderComponent({
    required this.restaurantName,
    required this.Maclogo,
    required this.orderImage,
    required this.orderRate,
    required this.Pepsi,
    required this.orderName,
    required this.res_name,
    required this.Fries,
    required this.restaurantLocation,
    required this.lettuce,
    required this.beefBurger,
    required this.pickles,
    required this.tomato,
    required this.tastySauce,
    required this.onion,
    required this.resphone,
    required this.price,
    required this.cheese,
    required this.bigtastycomponents,
    required this.resimage,
    required this.open,
    required this.rate,
  });

  Map<String, dynamic> toMap() {
    return {
      'restaurantName': restaurantName,
      'orderImage': orderImage,
      'orderRate': orderRate,
      'orderName': orderName,
      'Maclogo': Maclogo,
      'res_name': res_name,
      'resphone': resphone,
      'Fries': Fries,
      'price': price,
      'bigtastycomponents': bigtastycomponents,
      'resimage': resimage,
      'Pepsi': Pepsi,
      'restaurantLocation': restaurantLocation,
      'lettuce': lettuce,
      'rate': rate,
      'beefBurger': beefBurger,
      'pickles': pickles,
      'tomato': tomato,
      'onion': onion,
      'cheese': cheese,
      'tastySauce': tastySauce,
      'open': open,
    };
  }

  OrderComponent.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : restaurantName = doc.data()!["restaurantName"],
        orderImage = doc.data()!["orderImage"],
        orderRate = doc.data()!["orderRate"],
        Maclogo = doc.data()!["Maclogo"],
        resphone = doc.data()!["resphone"],
        orderName = doc.data()!["orderName"],
        restaurantLocation = doc.data()!["restaurantLocation"],
        open = doc.data()!["open"],
        rate = doc.data()!["rate"],
        Fries = doc.data()!["Fries"],
        lettuce = doc.data()!["lettuce"],
        Pepsi = doc.data()!["Pepsi"],
        res_name = doc.data()!["res_name"],
        beefBurger = doc.data()!["beefBurger"],
        pickles = doc.data()!["pickles"],
        bigtastycomponents = doc.data()!["bigtastycomponents"],
        tomato = doc.data()!["tomato"],
        cheese = doc.data()!["cheese"],
        onion = doc.data()!["onion"],
        tastySauce = doc.data()!["tastySauce"],
        price = doc.data()!["price"],
        resimage = doc.data()!["resimage"];
}
