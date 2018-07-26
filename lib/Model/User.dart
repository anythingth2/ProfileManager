import 'Employee.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

class User {
  String fullName;
  String position;
  List<Employee> members;

  User.fromJson(String jsonString) {
    Map<String, dynamic> userJson = json.decode(jsonString);
    this.fullName = userJson['fullName'];
    this.position = userJson['position'];
    this.members = userJson['members']
        .map<Employee>(
            (employee) => Employee(employee['fullName'], employee['position']))
        .toList();
  }
}
