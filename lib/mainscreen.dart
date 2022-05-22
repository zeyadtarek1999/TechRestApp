import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';

import 'Modules/login/login_screen.dart';
import 'layouts/Tech-Rest.layout/layout.dart';

class mainscreen extends StatelessWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return  homescreen() ;
          }else{

            return Login_Screen();
          }
        }),





    );
  }
}
