import 'package:profile_manager/UI/Home/HomePageInterface.dart';
import 'package:profile_manager/Data/DataReposity.dart';
class HomePagePresenter{
  HomePageInterface _view;
  HomePagePresenter(this._view);

  void initState(){
    _view.setProfileBar(DataReposity.user.fullName);
    _view.setProfileList(DataReposity.user.members);
  }

  void onSelectEmployee(int index){
   
    _view.redirectToProfilePage(  DataReposity.user.members[index].id);
  }
}