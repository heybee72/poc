import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trucks/utils/constant.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  bool _loading = false;
  bool _wrongOtp = false;
  bool _resentCode = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController pinEditingController = TextEditingController();

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
              // mainAxisAlignment: MainAxisAlignment.start,
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
            Container(
              child: Text(
                'We need to verify your phone number',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Constant.blue_color,
                    fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              child: Text(
                'Please enter the 6 digit code sent to your phone +234 *** *** 3257',
                style: TextStyle(fontSize: 16, color: Constant.blue_color),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: PinCodeTextField(
                    controller: pinEditingController,
                    length: 6,
                    onChanged: (String value) {},
                    onCompleted: (String value) {},
                    obscuringCharacter: '*',
                    obscureText: true,
                    autoFocus: true,
                    keyboardType: TextInputType.phone,
                    backgroundColor: Colors.transparent,
                    autoDisposeControllers: true,
                    enableActiveFill: true,
                    pinTheme: PinTheme(
                        inactiveColor: Colors.transparent,
                        selectedColor: _wrongOtp
                            ? Constant.pink_color
                            : Constant.blue_color,
                        activeColor: _wrongOtp
                            ? Constant.pink_color
                            : Constant.blue_color,
                        shape: PinCodeFieldShape.underline,
                        inactiveFillColor: Color(0XFFF4F4F4),
                        activeFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        fieldWidth: 40.0,
                        fieldHeight: 50.0,
                        borderRadius: BorderRadius.circular(5.0)),
                    appContext: context,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                    "Verify",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),

             SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Constant.pink_color,
                                ),
                                children: [
                                  TextSpan(text: 'Didn’t get a code?   '),
                                  TextSpan(
                                      text: "Retry",
                                      style: TextStyle(
                                        color: Constant.blue_color,
                                        fontWeight: FontWeight.w900,
                                      ))
                                ])),
                      ),
                    ),
          ],
        ),
      )),
    );
  }

  Text _labelText(String title) {
    return Text(
      "${title}",
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}
