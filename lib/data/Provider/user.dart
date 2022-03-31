import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  var fname;
  var lname;
  var phone;
  var email;

  User({
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
  });
}

class Users with ChangeNotifier {
  User _rider = User(
    fname: "",
    lname: "",
    phone: "",
    email: "",
  );
  User get rider => _rider;

  Future<void> setProfile(var data) async {
    _rider = User(
      fname: data['first_name'] ?? "",
      lname: data['last_name'] ?? "",
      phone: data['phone'] ?? "",
      email: data['email'] ?? "",
    );
    notifyListeners();
  }

  //update profile

}
