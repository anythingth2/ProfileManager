import 'dart:convert';

class Employee {
  int id;
  String fullName;
  String position;
  Employee(this.fullName, this.position) {}
  Employee.fromJson(Map<String, dynamic> employeeJson) {
    this.id = employeeJson['id'];
    this.fullName = employeeJson['fullName'];
    this.position = employeeJson['position'];
  }
}
