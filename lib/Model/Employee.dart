import 'dart:convert';
class Employee {
  String fullName;
  String position;
  Employee(this.fullName,this.position){}
  Employee.fromJson(String jsonString){
    Map<String,dynamic> employeeJson = json.decode(jsonString);
    fullName = employeeJson['fullName'];
    position = employeeJson['position'];
  }
}