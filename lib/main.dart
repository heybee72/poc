import 'package:flutter/material.dart';
import 'package:trucks/onboarding/get_started.dart';
import 'package:trucks/onboarding/select_screen.dart';
import 'package:trucks/onboarding/verify.dart';
import 'package:trucks/user/login_screen.dart';

import 'onboarding/splash_screen.dart';
import 'user/user_dashbaord.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trucks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserDashbaord(),
    );
  }
}
