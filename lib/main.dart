import 'package:flutter/material.dart';
import 'package:profile_manager/Home/HomePage.dart';
import 'package:profile_manager/Strings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.APP_NAME,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: Strings.APP_NAME),
    );
  }
}






