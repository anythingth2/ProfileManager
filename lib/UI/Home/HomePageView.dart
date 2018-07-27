import 'package:flutter/material.dart';
import 'package:profile_manager/Data/DataReposity.dart';
import 'package:profile_manager/Model/Employee.dart';
import 'package:profile_manager/Model/User.dart';
import 'package:profile_manager/Strings.dart';
import 'package:profile_manager/UI/Profile/ProfilePageView.dart';
import 'package:profile_manager/ColorRes.dart';
import 'package:profile_manager/UI/Home/HomePageInterface.dart';
import 'package:profile_manager/UI/Home/HomePagePresenter.dart';

class HomePage extends StatefulWidget {
  // HomePage({Key key, this.title}) : super(key: key);

  HomePage() : super() {}

  String title = 'Profile Manager';

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomePageInterface {
  BuildContext context;
  HomePagePresenter presenter;

  ProfileBar profileBar;
  ProfileList profileList;

  _HomePageState() : super() {
    presenter = HomePagePresenter(this);
    this.profileBar = ProfileBar();
    this.profileList = ProfileList(this);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
  this.context = context;
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
        ),
        body: Column(
          children: <Widget>[profileBar, profileList],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter.initState();
  }

  @override
  void setProfileBar(String fullName) {
    // TODO: implement setProfileBar
    this.profileBar.name = fullName;
  }

  @override
  void setProfileList(List<Employee> members) {
    // TODO: implement setProfileList
    this.profileList.members = members;
  }

  void onSelectEmployee(int index){
    presenter.onSelectEmployee(index);
  }

  void redirectToProfilePage(int employeeId) {
    
    Navigator.push(
        this.context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(employeeId),
        ));
  }
}

class ProfileBar extends StatefulWidget {
  String name;
 
  @override
  _ProfileBarState createState() {
    // TODO: implement createState
    return _ProfileBarState();
  }
}

class _ProfileBarState extends State<ProfileBar> {

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
              // Padding(
              //   padding: const EdgeInsets.only(right: 4.0),
              //   child: const Text(Strings.PROFILEBAR_NAME, style: bold),
              // ),
              Text(
                widget.name,
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
  List<Employee> members;
  _HomePageState parentState;

  ProfileList(this.parentState);
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  

  Widget _getItemUI(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        widget.parentState.onSelectEmployee(index);
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
                        Text('${widget.members[index].fullName}'),
                        Text('${widget.members[index].position}')
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
          itemCount:widget.members.length,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
        ),
      ),
    );
  }
}
