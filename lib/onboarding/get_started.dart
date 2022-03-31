import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trucks/onboarding/select_screen.dart';
import 'package:trucks/user/login_screen.dart';
import 'package:trucks/utils/constant.dart';

class GetStarted extends StatelessWidget {
  GetStarted({Key? key}) : super(key: key);

  TextEditingController nameTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController phoneNumTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  TextEditingController companyTEC = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String name = '';
    String email = '';
    String password = '';

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
              'First, Tell us about yourself',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Constant.blue_color,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              'Give us some information about you',
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
                  //Company name
                  const SizedBox(height: 10),
                  _labelText('Your Company name'),
                  const SizedBox(height: 6),

                  TextFormField(
                    onSaved: (value) {
                      email = value!;
                    },
                    controller: companyTEC,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    // key: const ValueKey('Company name'),
                    decoration: InputDecoration(
                      hintText: 'Enter your Company name',
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
                    validator: (value) {
                      if (value!.isEmpty ||
                          !value.contains(RegExp(r'[A-Z, a-z]'))) {
                        return 'Please enter a valid text';
                      }
                      return null;
                    },
                  ),

                  //
                  const SizedBox(height: 24),
                  _labelText('Your Name'),
                  const SizedBox(height: 6),
                  //name
                  TextFormField(
                    onSaved: (value) {
                      name = value!;
                    },
                    controller: nameTEC,
                    keyboardType: TextInputType.text,
                    // key: const ValueKey('name'),
                    decoration: InputDecoration(
                      hintText: 'Enter full name',
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
                    validator: (value) {
                      if (value!.isEmpty ||
                          value.contains(' 1, 2, 3, 4, 5, 6, 7, 8, 9, 0')) {
                        return 'Invalid Name Input';
                      }
                      return null;
                    },
                  ),

                  //phone number
                  const SizedBox(height: 24),
                  _labelText('Your Phone'),
                  const SizedBox(height: 6),

                  TextFormField(
                    onSaved: (value) {
                      email = value!;
                    },
                    controller: phoneNumTEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[ ]')),
                    ],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    // key: const ValueKey('email'),
                    decoration: InputDecoration(
                      hintText: 'Enter phone number',
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
                    validator: (value) {
                      if (value!.isEmpty ||
                          value.contains(RegExp(r'[A-Z, a-z]'))) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),

                  //

                  const SizedBox(height: 24),
                  _labelText('Your Email'),
                  const SizedBox(height: 6),
                  //email
                  TextFormField(
                    onSaved: (value) {
                      email = value!;
                    },
                    controller: emailTEC,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[ ]')),
                    ],
                    // key: const ValueKey('email'),
                    decoration: InputDecoration(
                      hintText: 'Enter email',
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
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  //
                  const SizedBox(height: 24),
                  _labelText('Password'),
                  const SizedBox(height: 6),
                  //password
                  TextFormField(
                    onSaved: (value) {
                      password = value!;
                    },
                    controller: passwordTEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[ ]')),
                    ],
                    obscureText: true,
                    // key: const ValueKey('password'),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Color(0XFF777777),
                      ),
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
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
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
                      onPressed: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        if (formKey.currentState!.validate()) {
                          //
                          final prefs = await SharedPreferences.getInstance();
                          //spliting the name into first name and last name

                          var split = nameTEC.text.split(" ");
                          print("this is the splited name: $split");
                          print("this is the phone: ${phoneNumTEC.text}");
                          print("this is the email: ${emailTEC.text}");
                          print("this is the companyName: ${companyTEC.text}");
                          print("this is the password: ${passwordTEC.text}");

                          //
                          prefs.setString("first_name", split[0]);
                          prefs.setString("last_name", split[1]);
                          prefs.setString("phone", phoneNumTEC.text);
                          prefs.setString("email", emailTEC.text);
                          prefs.setString("company_name", companyTEC.text);
                          prefs.setString("password", passwordTEC.text);

                          //Navigate to select screen
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectScreen()));
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        //naviagte to login screen
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Constant.pink_color,
                              ),
                              children: [
                                TextSpan(text: 'I have an account? '),
                                TextSpan(
                                    text: "Login",
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
      )),
    );
  }

  Text _labelText(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}
