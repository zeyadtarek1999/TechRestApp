import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/Modules/Location/location_screen.dart';
import 'package:firstproject/shared/network/local/cache_helper.dart';
import 'package:firstproject/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

import 'Modules/Branches/select_branch.dart';
import 'Modules/Checkout Screen/checkout_screen.dart';
import 'Modules/Delivery Screens/delivery_homepage.dart';
import 'Modules/Delivery Screens/mac_delivery_screen.dart';
import 'Modules/Dine in Screens/dine_in_screen.dart';
import 'Modules/Menu/dinein_menu.dart';
import 'Modules/Menu/menu_screen.dart';
import 'Modules/More Screen/more_screen.dart';
import 'Modules/Order Tracking/order_tracking_1.dart';
import 'Modules/Order Tracking/order_tracking_3.dart';
import 'Modules/Profile Screen/profile_screen.dart';
import 'Modules/Resetvation Details/reservation_details.dart';
import 'Modules/Splash Screen/splash_screen.dart';
import 'Modules/Table Details/table_details.dart';
import 'Modules/Visa Details/visa_details.dart';
import 'Modules/after_boarding/after_board_screen.dart';
import 'Modules/order_components/order_components.dart';
import 'Modules/register/signup_screen.dart';
import 'layouts/Tech-Rest.layout/layout.dart';
import 'mainscreen.dart';


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