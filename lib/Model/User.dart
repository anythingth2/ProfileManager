import 'Employee.dart';
import 'dart:convert';

class User {
  int id;
  String fullName;
  String position;
  List<Employee> members;
  User();
  User.fromJson(Map<String, dynamic> userJson) {
    this.id = userJson['id'];
    this.fullName = userJson['fullName'];
    this.position = userJson['position'];
    if (userJson['members'] != null)
      this.members = userJson['members']
          .map<Employee>((employee) =>
              Employee.fromJson(employee))
          .toList();
  }
}
