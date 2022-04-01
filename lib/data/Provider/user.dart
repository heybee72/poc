import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String fname;
  String lname;
  String phone;
  String email;
  String companyName;
  var userId;

  User({
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
    required this.companyName,
    required this.userId,
  });
}

class Users with ChangeNotifier {
  User _user = User(
    fname: "",
    lname: "",
    phone: "",
    email: "",
    companyName: "",
    userId: "",
  );
  User get user => _user;

  Future<void> setProfile(var data) async {
    _user = User(
      fname: data['firstName'] ?? "",
      lname: data['lastName'] ?? "",
      phone: data['phoneNumber'] ?? "",
      email: data['email'] ?? "",
      companyName: data['companyName'] ?? "",
      userId: data['userId'] ?? "",
    );
    notifyListeners();
  }

  //update profile

}
