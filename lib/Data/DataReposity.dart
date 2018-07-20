import 'dart:async';
import 'package:profile_manager/Model/User.dart';
import 'package:profile_manager/Data/RESTful/Service.dart';
import 'package:profile_manager/Strings.dart';
import 'package:http/http.dart' as http;

class DataReposity {
  static Future<User> fetchUserInfo(int id) async {
    http.Response response = await Service.get(ApiPath.userInfo);
    
    return User();
  }
}
