import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/Modules/About%20US/about_us.dart';
import 'package:firstproject/Modules/Change%20language/change_lang.dart';
import 'package:firstproject/Modules/Notifications/notification_screen.dart';
import 'package:firstproject/Modules/on_boarding/on_boarding_screen.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
        backgroundColor: HexColor("#F0997A"),
      ),
      body: Stack(
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
    );
  }
}
