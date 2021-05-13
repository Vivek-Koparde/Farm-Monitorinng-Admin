import 'package:flutter/material.dart';
import 'package:smart_farm_monitoring_admin/farm.dart';
import 'package:smart_farm_monitoring_admin/navigate_bar.dart';
import 'package:smart_farm_monitoring_admin/plot.dart';
import 'package:smart_farm_monitoring_admin/voucher.dart';

import 'LoginScreen.dart';
import 'UserRegistration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());

}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          NavigateBar.id: (context) => NavigateBar(),
          //Plot.id: (context) => Plot(),
          UserRegistration.id: (context) => UserRegistration(),
          //Voucher.id: (context) => Voucher(),

        }
    );
  }
}


