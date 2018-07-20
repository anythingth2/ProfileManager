import 'package:flutter/material.dart';
import 'package:profile_manager/Home/HomePage.dart';
import 'package:profile_manager/Strings.dart';
import 'package:profile_manager/Data/RESTful/Service.dart';
import 'package:profile_manager/Data/DataReposity.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Service.setLogging(true);
    

    return new MaterialApp(
      title: Strings.APP_NAME,
      theme: new ThemeData(
          primarySwatch: Colors.blue, backgroundColor: Colors.lightBlue),
      home: new HomePage(title: Strings.APP_NAME),
    );
  }
}
