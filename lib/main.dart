import 'package:flutter/material.dart';
import 'package:pay_at_once/LoginPage.dart';
import 'package:pay_at_once/SelectionPage.dart';
import 'package:pay_at_once/SuccessPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay At Once',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      initialRoute: '/LoginPage',
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => new LoginPage(),
        '/SelectionPage': (BuildContext context) => new SelectionPage(),
        '/SuccessPage': (BuildContext context) => new SuccessPage(),
      },
    );
  }
}

