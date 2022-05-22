import 'package:firstproject/Modules/Profile%20Screen/profile_screen.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Order Tracking/dineinordertracking.dart';
import '../Order Tracking/order_tracking_1.dart';
import '../Visa Details/dineinvisa_details.dart';
import '../Visa Details/visa_details.dart';

class dineincheckout_screen extends StatefulWidget {
  dineincheckout_screen({required this.subTotal,  });

  String  subTotal;


  @override
  State<dineincheckout_screen> createState() => _checkout_screenState();
}

class _checkout_screenState extends State<dineincheckout_screen> {
  dynamic _value = 1 ;
  var taxes =16 ;


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
            onPressed: () => Navigator.of(context).pop()),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Checkout',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment method',
                style: TextStyle(
                    fontSize: 13, color: Colors.black.withOpacity(0.5)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor('#F6F6F6'),
                ),
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('images/Cash.png'),
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Pay by Cash',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Radio(
                          value: 1,
                          groupValue: _value,
                          onChanged: (value){
                            setState(() {
                              _value =value ;
                            });


                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  HexColor('#F6F6F6'),
                ),
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('images/Visa.png'),
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add credit/Debit Card',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value){
                            setState(() {
                              _value =value ;
                            });

                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 5,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [Text('Sub total'), Spacer(), Text('${widget.subTotal}')],
              ),

              SizedBox(
                height: 20,
              ),
              Row(
                children: [Text('Taxes & Services '), Spacer(), Text('${taxes}')],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [Text('Total'), Spacer(), Text(' ${total ()} ')],
              ),
              SizedBox(height: 40),
              Container(
                height: 5,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Delivery Address:  nasrcity',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),

              SizedBox(
                height: 20,
              ),
              defaultButton(
                  width: double.infinity,
                  height: 50,
                  function: () {
                    if(_value == 1 ){
                      navigateAndFinish(context, dineinorder_tracking());

                    }else  {

                      navigateTo(context, dineinvisa_details());


                    }
                  },
                  text: 'Confirm',
                  write_text_color: Colors.white,
                  background: Colors.deepOrangeAccent.shade100)
            ],
          ),
        ),
      ),
    );
  }
  dynamic  total () {
    if (widget.subTotal.isNotEmpty ) {
      final totalprice = double.parse(widget.subTotal )  +taxes ;
      return totalprice ;
    }
  }
}


