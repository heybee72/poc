import 'package:flutter/material.dart';
import 'package:trucks/utils/constant.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  int _value = 1;
  Color _defaultColor = Constant.lightgrey_color;
  Color _activeColor = Constant.lightpink_color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: [
                Image.asset('assets/images/dot.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Image.asset('assets/images/dot.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Image.asset('assets/images/line1.png'),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Container(
                child: Text(
                  'FInally tell us how you will use POC',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Constant.blue_color,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              child: Text(
                'What would you be using POC for?',
                style: TextStyle(fontSize: 16, color: Constant.blue_color),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              child: Column(
                children: [
                  Card(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    color: _value == 1 ? _activeColor : _defaultColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/truck_mini.png',
                            width: 97,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Post my trucks",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Constant.blue_color,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "I want to post videos of my truck available for rent",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Transform.scale(
                            scale: 2,
                            child: Radio(
                              value: 1,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value as int;
                                });
                              },
                              activeColor: Constant.blue_color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Card(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    color: _value == 2 ? _activeColor : _defaultColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/truck_mini.png',
                            width: 97,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Rent trucks",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Constant.blue_color,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "I want to rent trucks on POC",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Transform.scale(
                            scale: 2,
                            child: Radio(
                              value: 2,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value as int;
                                });
                              },
                              activeColor: Constant.blue_color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 60.0,
                    margin: EdgeInsets.only(top: 26.0, bottom: 8.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        primary: Constant.blue_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
