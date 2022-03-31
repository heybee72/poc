import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trucks/user/user_dashbaord.dart';
import 'data/Provider/user.dart';
import 'onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Users()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trucks',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserDashbaord(),
      ),
    );
  }
}
