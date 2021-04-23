//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:groupProject/About.dart';
import 'package:groupProject/Account.dart';
import 'package:groupProject/LoginPage.dart';
import 'package:groupProject/MapSample.dart';
// import 'app_example/Login_Screen.dart';
import 'LoginPage.dart';
//Roop Malhans
//Jashanpreet Mann



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue), home: LoginPage());
  }
}