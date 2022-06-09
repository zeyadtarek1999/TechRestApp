import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../Rate us/rate_us.dart';

class order_tracking_three extends StatefulWidget {
  @override
  State<order_tracking_three> createState() => _order_tracking_threeState();
}

class _order_tracking_threeState extends State<order_tracking_three> {
  dynamic time = 7;

  @override
  void initState() {
    Timer(Duration(seconds: time), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => rate_screen(),
        ),
        (Route<dynamic> route) => false,
      );
      ;
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: Image(
              image: AssetImage('images/Order_tracking.png'),
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Estimated Time : ${time} Sec',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 230,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(300)),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image(
                    image: AssetImage('images/delivery man.png'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Roshdy Ahmed',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Spacer(),
                IconButton(
                    onPressed: ()async {FlutterPhoneDirectCaller.callNumber('01141974882');
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Calling...')),
                      // );
                    },
                    icon: Icon(Icons.phone_enabled_outlined))
              ],
            ),
          )
        ],
      ),
    );
  }
}
