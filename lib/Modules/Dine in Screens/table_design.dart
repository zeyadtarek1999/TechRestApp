import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import '../Table Details/table_details.dart';

class table_design extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Select your table',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 40,
              ),
              Image(
                image: AssetImage('images/table 2D.png'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 45,
              ),
              Center(
                child: Column(
                  children: [
                    defaultButton(
                        width: 200,
                        height: 50,
                        function: () {
                          navigateTo(context, table_details());
                        },
                        text: 'CONTINUE',
                        write_text_color: Colors.white,
                        background: Colors.deepOrangeAccent.shade100),
                  ],
                ),
              )
            ])));
  }
}
