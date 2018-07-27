import 'package:flutter/material.dart';
import 'package:profile_manager/Data/DataReposity.dart';
import 'package:profile_manager/Model/User.dart';
import 'SelectUserInterface.dart';
import 'SelectUserPresenter.dart';
import 'package:profile_manager/UI/Home/HomePageView.dart';

class SelectUserPage extends StatefulWidget {
  String title;
  List<int> users = [1, 2, 3];

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

  List<DropdownMenuItem<int>> getListUserItems() {
    List<DropdownMenuItem<int>> items;
    items = presenter.users
        .map<DropdownMenuItem<int>>((user) => DropdownMenuItem<int>(
              value: user.id,
              child: Text('${user.fullName}'),
            ))
        .toList();
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: Center(
        child: DropdownButton(
          items: getListUserItems(),
          onChanged: onSelectUser,
          hint: Text('เลือกบัญชีผู้ใช้'),
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

  @override
  void refrsh() {
    // TODO: implement refrsh
    setState(() {});
  }
}
