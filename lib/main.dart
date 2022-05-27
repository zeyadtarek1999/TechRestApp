import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/shared/network/local/cache_helper.dart';
import 'package:firstproject/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

import 'Modules/Splash Screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();

  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash_screen(),
    );
  }
}
