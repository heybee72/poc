import 'package:flutter/material.dart';
import 'package:trucks/add_truck/add_truck_type.dart';
import 'package:trucks/utils/constant.dart';

class AddTruck extends StatelessWidget {
  AddTruck({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController truckName = TextEditingController();
  TextEditingController truckLocation = TextEditingController();
  TextEditingController truckDescription = TextEditingController();
  TextEditingController truckPlateNumber = TextEditingController();

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
            const Padding(
              padding: EdgeInsets.only(right: 36.0),
              child: Text(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid Name Input';
                      }
                      return null;
                    },
                    controller: truckName,
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
                  _labelText('Truck Plate Number'),
                  const SizedBox(height: 6),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    // key: const ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid number Input';
                      }
                      return null;
                    },
                    controller: truckPlateNumber,
                    decoration: InputDecoration(
                      hintText: 'Enter truck Plate Number',
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid location Input';
                      }
                      return null;
                    },
                    // key: const ValueKey('email'),
                    controller: truckLocation,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid Description Input';
                      }
                      return null;
                    },
                    // key: const ValueKey('email'),
                    controller: truckDescription,
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
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          Map<String, dynamic> truckDetails = {
                            'truckName': truckName.text,
                            'truckLocation': truckLocation.text,
                            'truckDescription': truckDescription.text,
                            'truckPlate': truckPlateNumber.text,
                          };
                          // navigate to add truck type
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddTruckType(
                                truckDetails: truckDetails,
                              ),
                            ),
                          );
                        }
                      },
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
