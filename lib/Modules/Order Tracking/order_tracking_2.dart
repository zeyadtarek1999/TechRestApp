import 'dart:async';

import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';

import 'order_tracking_3.dart';

class order_tracking_two extends StatefulWidget {
  @override
  State<order_tracking_two> createState() => _order_tracking_twoState();
}

class _order_tracking_twoState extends State<order_tracking_two> {
  dynamic time = 7 ;

  @override
  void initState() {
    Timer(Duration(seconds: time), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => order_tracking_three(),
        ),(Route<dynamic>route)=>false,
      );;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Order Tracking ',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
                color: Colors.black)),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 70,
        ),
        Container(height: 200,width: 200,
          child: Center(
              child: Image(
                image: AssetImage(
                  'images/cooking-pot.gif',
                ),
              )),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          width: 200,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(300)),
          child: Center(
              child: Text(
                'Order preparation...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              )),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: LinearProgressIndicator(
            color: Colors.deepOrangeAccent.shade100,
            backgroundColor: Colors.grey,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Estimated Time : ${time} Sec',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 50,
        ),

      ]),
    );
  }
}
