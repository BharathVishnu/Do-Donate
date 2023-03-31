import 'package:fdapp/signup.dart';
//import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "./signinnew.dart";
import "./splashscreen.dart";
import 'package:firebase_core/firebase_core.dart';
import "./home.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
