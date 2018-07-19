import 'package:flutter/material.dart';
import 'package:profile_manager/Strings.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
        ),
        body: Column(
          children: <Widget>[ProfileBar()],
        ));
  }
}

class ProfileBar extends StatefulWidget {
  @override
  _ProfileBarState createState() {
    // TODO: implement createState
    return _ProfileBarState();
  }
}

class _ProfileBarState extends State<ProfileBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      constraints: BoxConstraints.expand(height: 100.0),
      decoration: BoxDecoration(color: Colors.cyan),
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage('assets/user.png'),
            width: 64.0,
            height: 64.0,
          ),
        ],
      ),
    );
  }
}
