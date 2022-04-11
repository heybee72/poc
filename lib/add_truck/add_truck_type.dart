import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trucks/utils/constant.dart';

class AddTruckType extends StatefulWidget {
  AddTruckType({Key? key}) : super(key: key);

  @override
  _AddTruckTypeState createState() => _AddTruckTypeState();
}

class _AddTruckTypeState extends State<AddTruckType> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool activeTransmissionColor1 = false;
  bool activeTransmissionColor2 = false;
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
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
                  child: Image.asset('assets/images/line1.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Image.asset('assets/images/dot.png'),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 36.0),
              child: const Text(
                'Tell us more about your truck',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Constant.blue_color,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              'More information about your truck',
              style: TextStyle(fontSize: 16, color: Constant.blue_color),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  _labelText('Truck Size'),
                  const SizedBox(height: 6),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    // key: const ValueKey('email'),
                    decoration: InputDecoration(
                      hintText: 'Enter truck size',
                      hintStyle: const TextStyle(
                          color: Color(0XFF777777), fontSize: 16.0),
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constant.blue_color, width: 2.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Constant.grey_color,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _labelText('Select transmission'),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            activeTransmissionColor1 = true;
                            activeTransmissionColor2 = false;
                          });
                        },
                        child: Text(
                          'Manual',
                          style: TextStyle(
                            fontSize: 16,
                            color: activeTransmissionColor1
                                ? Constant.blue_color
                                : Constant.grey_color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.only(
                            top: 16.0,
                            bottom: 16.0,
                            right: 26.0,
                            left: 26.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(
                            color: activeTransmissionColor1
                                ? Constant.blue_color
                                : Constant.grey_color,
                            width: 2.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            activeTransmissionColor1 = false;
                            activeTransmissionColor2 = true;
                          });
                        },
                        child: Text(
                          'Automatic',
                          style: TextStyle(
                            fontSize: 16,
                            color: activeTransmissionColor2
                                ? Constant.blue_color
                                : Constant.grey_color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.only(
                            top: 16.0,
                            bottom: 16.0,
                            right: 26.0,
                            left: 26.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(
                            color: activeTransmissionColor2
                                ? Constant.blue_color
                                : Constant.grey_color,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _labelText('Does this truck have an air conditioner?'),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: _switchValue,
                          onChanged: (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                          // trackColor: Constant.light_blue3,
                          thumbColor: Constant.deep_blue,
                          activeColor: Constant.light_blue3,
                        ),
                      ),
                      Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: 16,
                          color: _switchValue
                              ? Constant.blue_color
                              : Constant.grey_color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    height: 60.0,
                    margin: const EdgeInsets.only(top: 26.0, bottom: 8.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        primary: Constant.blue_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      onPressed: () async {},
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Text _labelText(String title) {
    return Text(
      "${title}",
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}
