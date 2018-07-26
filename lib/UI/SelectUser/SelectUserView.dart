import 'package:flutter/material.dart';
import 'package:profile_manager/Model/User.dart';
import 'SelectUserInterface.dart';
import 'SelectUserPresenter.dart';
import 'package:profile_manager/UI/Home/HomePageView.dart';

class SelectUserPage extends StatefulWidget {
  String title;

  SelectUserPage(this.title);
  @override
  _SelectUserPageState createState() => _SelectUserPageState(this.title);
}

class _SelectUserPageState extends State<SelectUserPage>
    implements SelectUserInterface {
  SelectUserPresenter presenter;
  String title;
  _SelectUserPageState(this.title) : super() {
    presenter = SelectUserPresenter(this);
  }

  void onSelectUser(int id) {
    presenter.onSelectUser(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: Center(
        child: RaisedButton(
          child: Text('id:1'),
          onPressed: () {
            onSelectUser(1);
          },
        ),
      ),
    );
  }

  @override
  void goHomePage() {
    // TODO: implement goHomePage
    Navigator
        .of(this.context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
