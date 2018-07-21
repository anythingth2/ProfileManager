import 'package:flutter/material.dart';
import 'package:profile_manager/UI/HomePage.dart';
import 'package:profile_manager/Strings.dart';
import 'package:profile_manager/Data/RESTful/Service.dart';
import 'package:profile_manager/Data/DataReposity.dart';
import 'package:map_view/map_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Service.setLogging(true);
    
    MapView.setApiKey(MapApiKeys.key);

    return new MaterialApp(
      title: Strings.APP_NAME,
      theme: new ThemeData(
          primarySwatch: Colors.blue, ),
      home: new HomePage(title: Strings.APP_NAME),
    );
  }
}
