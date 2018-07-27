import 'ProfilePageInterface.dart';
import 'package:profile_manager/Data/DataReposity.dart';
import 'package:flutter/material.dart';

class ProfilePagePresenter {
  ProfilePageInterface _view;
  int id;
  ProfilePagePresenter(this._view,this.id) {
    
  }
  void initState(){
    DataReposity.fetchEmployee(this.id).then((employee) {

        _view.setEmployee(employee);
    });
  }
}
