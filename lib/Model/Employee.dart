import 'dart:convert';
import 'package:flutter/material.dart';
class Employee {
  String fullName;
  String position;
  Employee(this.fullName,this.position){debugPrint('$fullName $position');}
  Employee.fromJson(String jsonString){
    Map<String,dynamic> employeeJson = json.decode(jsonString);
    fullName = employeeJson['fullName'];
    position = employeeJson['position'];
  }
}