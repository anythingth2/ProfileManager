import 'SelectUserInterface.dart';
import 'SelectUserView.dart';
import 'package:profile_manager/Data/DataReposity.dart';
class SelectUserPresenter  {
  SelectUserInterface _view;
  SelectUserPresenter(this._view) {}

  void onSelectUser(int id){
    DataReposity.fetchUserInfo(id).then((user){
      _view.goHomePage();
    });
  }
  
}
