import 'package:flutter/material.dart';
import 'package:trucks/utils/constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/truck1.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/line1.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Image.asset('assets/images/dot.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Image.asset('assets/images/dot.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Hire a truck for your Logistics',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Constant.blue_color,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.25,
                      child: Text(
                        "POC let’s you find and connect with truck drivers accross the nation to accomplish your logsitic goals.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Constant.blue_color,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, right: 20),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Constant.blue_color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text(
                                    "Let’s Get Started",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Login", style: TextStyle(color: Constant.blue_color, fontSize: 16, fontWeight: FontWeight.w800),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
