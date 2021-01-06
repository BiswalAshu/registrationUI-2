import 'package:flutter/material.dart';
//import 'package:registration_ui2/login/model/user-info.dart';
import 'package:registration_ui2/login/screens/login-page.dart';
//import 'package:registration_ui2/login/screens/profile-page.dart';
//import 'package:registration_ui2/login/services/http-service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        //'/profile':(context)=> ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
