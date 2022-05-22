import 'package:flutter/material.dart';

import '../../layouts/Tech-Rest.layout/layout.dart';
import '../../shared/components/components.dart';

class sent_an_OTP extends StatefulWidget {
  sent_an_OTP({required this.verificationId,  required this.isTimeOut2, required this.phone});

  final String verificationId;
  final bool isTimeOut2;
  final String phone;

  @override
  State<sent_an_OTP> createState() => _sent_an_OTPState();
}

class _sent_an_OTPState extends State<sent_an_OTP> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      'We have sent an OTP to your phone ',
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Text('+20 ${widget.phone}'),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 50,
                      child: Text(
                        'Please check your phone  ',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      )),
                  SizedBox(
                    height: 47,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: defaultFormField(
                        controller: otpController,
                        type: TextInputType.text,
                        text: 'Enter OTP',
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 307,
                    height: 56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.deepOrangeAccent[100]),
                    child: MaterialButton(
                      onPressed: ()  {

                        navigateAndFinish(context, homescreen());


                      }
                      ,
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}