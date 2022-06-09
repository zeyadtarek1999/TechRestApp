import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/Modules/About%20US/about_us.dart';
import 'package:firstproject/mainscreen.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'More',
          style: TextStyle(
              color: HexColor('#4A4B4D'), fontWeight: FontWeight.normal),
        ),
        backgroundColor: HexColor("#FFFFFF"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Stack(
          children: [
            ListView(children: [
              Card(
                child: ListTile(
                  title: Text('About us'),
                  leading: Icon(Icons.info_outlined),
                  iconColor: HexColor('#F0997A'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    navigateTo(context, aboutus());
                  },
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      decoration: BoxDecoration(
                          color: HexColor("#ed0c0c"),
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.all(5),
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          navigateAndFinish(context, mainscreen());
                        },
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.white),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 110),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'LOG OUT  ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
