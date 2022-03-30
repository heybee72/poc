import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trucks/data/Network/rest_api.dart';
import 'package:trucks/user/user_dashbaord.dart';
import 'package:trucks/utils/constant.dart';

import '../onboarding/get_started.dart';
import '../utils/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController passwordTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Text(
                'Welcome back',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Constant.blue_color,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                'Please provide your login details',
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
                    _labelText('Your Email'),
                    const SizedBox(height: 6),
                    TextFormField(
                      onSaved: (value) {
                        email = value!;
                      },
                      controller: emailTEC,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      key: const ValueKey('email'),
                      decoration: InputDecoration(
                        hintText: 'Enter email',
                        hintStyle: const TextStyle(
                            color: Color(0XFF777777), fontSize: 16.0),
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Constant.blue_color, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Constant.grey_color,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    _labelText('Password'),
                    const SizedBox(height: 6),
                    TextFormField(
                      onSaved: (value) {
                        password = value!;
                      },
                      controller: passwordTEC,
                      obscureText: true,
                      key: const ValueKey('password'),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Color(0XFF777777),
                        ),
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Constant.blue_color, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Constant.grey_color,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
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
                          "Login",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onPressed: () async {
                          //
                          loadingDialog(context, "Please Wait");

                          var result = await login(
                              username: emailTEC.text,
                              password: passwordTEC.text);
                          if (result['error'] == false) {
                            Navigator.pop(context);
                            //naviagte to Home screen
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserDashbaord()));
                          } else {
                            Navigator.pop(context);
                            openDialog(context, "Registration State",
                                "Registration Failed... \n ${result['message']}",
                                () {
                              Navigator.pop(context);
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          //naviagte to register screen
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GetStarted()));
                        },
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Constant.pink_color,
                                ),
                                children: [
                                  TextSpan(text: 'I don’t have an account?   '),
                                  TextSpan(
                                      text: "Register",
                                      style: TextStyle(
                                        color: Constant.blue_color,
                                        fontWeight: FontWeight.w900,
                                      ))
                                ])),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _labelText(String title) {
    return Text(
      "${title}",
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}
