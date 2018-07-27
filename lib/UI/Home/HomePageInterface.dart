import 'package:flutter/material.dart';
import 'package:profile_manager/Model/Employee.dart';

abstract class HomePageInterface {

  
  void setProfileBar(String fullName);
  void setProfileList(List<Employee> members);

  void redirectToProfilePage(int employeeId);
}
