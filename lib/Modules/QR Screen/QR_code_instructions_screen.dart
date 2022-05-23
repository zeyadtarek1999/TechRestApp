import 'package:firstproject/Modules/QR%20Screen/scanqr.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';

class  QR_instructions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('How to scan QR code',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Image(image: AssetImage('images/QR.GIF'), width: double.infinity, fit: BoxFit.cover,),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1- Click on scan',textAlign: TextAlign.center, style: TextStyle(fontSize: 15,color: Colors.black ),),
                        SizedBox(height: 20,),
                        Text('2- Put the camera on the QR code with distance to get all the code scanned', style: TextStyle(color: Colors.black,fontSize: 15),),
                        SizedBox(height: 20,),
                        Text('3- Menu will appear',textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: 15),),
                        SizedBox(height: 60,),
                      ],
                    ),
                  ),

                  Center(
                    child: Column(
                      children: [
                        defaultButton(
                            width: 200,
                            height: 50,
                            function: (){
                              navigateTo(context, ScanScreen());
                            },
                            text: 'Scan',
                            write_text_color: Colors.white,
                            background: Colors.deepOrangeAccent.shade100),
                      ],
                    ),
                  )


                ]
            )
        )
    );

  }
}