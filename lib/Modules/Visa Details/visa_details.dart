import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../Order Tracking/order_tracking_1.dart';

class visa_details extends StatelessWidget {

  var card_number_Controller=TextEditingController();
  var MM_Controller=TextEditingController();
  var YY_Controller=TextEditingController();
  var Security_Controller=TextEditingController();
  var first_Name_Controller=TextEditingController();
  var last_Name_Controller=TextEditingController();
  var formKey = GlobalKey<FormState>();

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
        title: Text('Visa Details',style: TextStyle(color:Colors.black),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add Credit/Debit Card:',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                SizedBox(height: 30,),

                TextFormField(
                  controller:card_number_Controller ,
                  keyboardType: TextInputType.number,
                  validator:  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Card Number ';
                    }
                    return null;
                  },
                  decoration:InputDecoration(
                    hintText: 'Card Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(300),
                        borderSide:  BorderSide(color: Colors.white,width: 2)
                    ),
                    hintStyle: TextStyle(color: Colors.grey,),
                    prefixIcon: Icon(Icons.credit_card,color: Colors.purple.shade400,),

                    filled: true,
                    fillColor: Colors.grey[200],

                  ),
                )
                ,SizedBox(height: 30,),
                Row(
                  children: [
                    Text('Expiry'),
                    SizedBox(width: 33,),
                    Container(
                      width: 110,
                      child:
                      TextFormField(
                        controller:MM_Controller ,
                        keyboardType: TextInputType.number,
                        validator:  (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Expiry month ';
                          }
                          return null;
                        },
                        decoration:InputDecoration(
                          hintText: 'MM',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(300),
                              borderSide:  BorderSide(color: Colors.white,width: 2)
                          ),
                          hintStyle: TextStyle(color: Colors.grey,),
                          prefixIcon: Icon(Icons.date_range,color: Colors.purple.shade400,),

                          filled: true,
                          fillColor: Colors.grey[200],

                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 110,
                      child:
                      TextFormField(
                        controller:YY_Controller ,
                        keyboardType: TextInputType.number,
                        validator:  (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Expiry year ';
                          }
                          return null;
                        },
                        decoration:InputDecoration(
                          hintText: 'YY',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(300),
                              borderSide:  BorderSide(color: Colors.white,width: 2)
                          ),
                          hintStyle: TextStyle(color: Colors.grey,),
                          prefixIcon: Icon(Icons.date_range,color: Colors.purple.shade400,),

                          filled: true,
                          fillColor: Colors.grey[200],

                        ),
                      ),



                    ),

                  ],
                ),
                SizedBox(height: 30,),
                TextFormField(
                  controller:Security_Controller ,
                  keyboardType: TextInputType.number,
                  validator:  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Security Code ';
                    }
                    return null;
                  },
                  decoration:InputDecoration(
                    hintText: 'Security Code',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(300),
                        borderSide:  BorderSide(color: Colors.white,width: 2)
                    ),
                    hintStyle: TextStyle(color: Colors.grey,),
                    prefixIcon: Icon(Icons.key,color: Colors.purple.shade400,),

                    filled: true,
                    fillColor: Colors.grey[200],

                  ),
                ),

                SizedBox(height: 30,),
                TextFormField(
                  controller:first_Name_Controller ,
                  keyboardType: TextInputType.text,
                  validator:  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your First Name ';
                    }
                    return null;
                  },
                  decoration:InputDecoration(
                    hintText: 'First Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(300),
                        borderSide:  BorderSide(color: Colors.white,width: 2)
                    ),
                    hintStyle: TextStyle(color: Colors.grey,),
                    prefixIcon: Icon(Icons.person,color: Colors.purple.shade400,),

                    filled: true,
                    fillColor: Colors.grey[200],

                  ),
                ),

                SizedBox(height: 30,),
                TextFormField(
                  controller:last_Name_Controller ,
                  keyboardType: TextInputType.text,
                  validator:  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Last Name ';
                    }
                    return null;
                  },
                  decoration:InputDecoration(
                    hintText: 'Last Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(300),
                        borderSide:  BorderSide(color: Colors.white,width: 2)
                    ),
                    hintStyle: TextStyle(color: Colors.grey,),
                    prefixIcon: Icon(Icons.person,color: Colors.purple.shade400,),

                    filled: true,
                    fillColor: Colors.grey[200],

                  ),
                ),


                SizedBox(height: 50,),
                defaultButton(
                    width: double.infinity,
                    height: 50,
                    function: (){
                      if (formKey.currentState!.validate()) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Done')),
                      );
                      navigateAndFinish (context, order_tracking_one());
                    }},
                    text: 'Continue',
                    write_text_color: Colors.white,
                    background: Colors.deepOrangeAccent.shade100)
              ],
            ),
          ),
        ),
      ),
    );
  }
}