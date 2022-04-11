import 'package:flutter/material.dart';
import 'package:trucks/utils/constant.dart';

class AddTruck extends StatelessWidget {
  AddTruck({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
            Padding(
              padding: const EdgeInsets.only(right: 36.0),
              child: const Text(
                'First, Tell us about your truck',
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
              'Tell us about your truck',
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
                  _labelText('Truck Name'),
                  const SizedBox(height: 6),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    // key: const ValueKey('email'),
                    decoration: InputDecoration(
                      hintText: 'Enter truck name',
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
               
                  _labelText('Location'),
                  const SizedBox(height: 6),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    // key: const ValueKey('email'),
                    decoration: InputDecoration(
                      hintText: 'Enter location',
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

                  _labelText('Description'),
                  const SizedBox(height: 6),
                  TextFormField(
                    maxLines: 5,
                    minLines: 3,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    // key: const ValueKey('email'),
                    decoration: InputDecoration(
                      hintText: 'Type truck description',
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
