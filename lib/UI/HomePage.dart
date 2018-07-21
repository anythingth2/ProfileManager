import 'package:flutter/material.dart';
import 'package:profile_manager/Data/DataReposity.dart';
import 'package:profile_manager/Strings.dart';
import 'package:profile_manager/UI/ProfilePage.dart';
import 'package:profile_manager/ColorRes.dart';
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
          children: <Widget>[ProfileBar(), ProfileList()],
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
  String name = 'test';
  static const TextStyle regular = TextStyle(
    color: Colors.white,
    fontSize: 14.0,
  );
  static const TextStyle bold = TextStyle(
      color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      constraints: BoxConstraints.expand(height: 100.0),
      decoration: BoxDecoration(color: ColorRes.barColor, boxShadow: [
        BoxShadow(
          blurRadius: 4.0,
        )
      ]),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image(
              image: AssetImage('assets/user.png'),
              width: 64.0,
              height: 64.0,
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: const Text(Strings.PROFILEBAR_NAME, style: bold),
              ),
              Text(
                name,
                style: regular,
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProfileList extends StatefulWidget {
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  void redirectToProfilePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfilePage(),));
  }

  Widget _getItemUI(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        redirectToProfilePage(context);
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 16.0),
        elevation: 4.0,
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              child: Row(children: <Widget>[
                Image(
                    image: AssetImage('assets/user.png'),
                    width: 64.0,
                    height: 64.0),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Employee Name'),
                        Text('Employee Position')
                      ],
                    ),
                  ),
                )
              ]),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorRes.backgroundColor,
        ),
        child: ListView.builder(
          itemBuilder: _getItemUI,
          itemCount: 10,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
        ),
      ),
    );
  }
}
