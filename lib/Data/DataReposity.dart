import 'dart:async';
import 'package:profile_manager/Model/User.dart';
import 'package:profile_manager/Data/RESTful/Service.dart';
import 'package:profile_manager/Strings.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataReposity {
  static User user;
  static List<User> allUser = <User>[User()];
  static Future<User> fetchUserInfo(int id) async {
    http.Response response = await Service.get('${ApiPath.homePage}$id');
    user = User.fromJson(json.decode(response.body));
  }

  static Future<List<User>> fetchAllUser() async {
    http.Response response = await Service.get('${ApiPath.allUser}');
    List usersJson = json.decode(response.body);
    debugPrint('debug : ${usersJson.toString()}');
    allUser = usersJson.map<User>((userJson) => User.fromJson(userJson)).toList();
    return allUser;
  }
}
