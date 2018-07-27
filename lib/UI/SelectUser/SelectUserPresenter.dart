import 'SelectUserInterface.dart';
import 'SelectUserView.dart';
import 'package:profile_manager/Data/DataReposity.dart';

class SelectUserPresenter {
  SelectUserInterface _view;
  SelectUserPresenter(this._view) {
    DataReposity.fetchAllUser().then((users){_view.refrsh();});
  }
  get users => DataReposity.allUser;

  void onSelectUser(int id) {
    DataReposity.fetchUserInfo(id).then((user) {
      _view.goHomePage();
    });
  }
}
