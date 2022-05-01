import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:trucks/data/Network/rest_api.dart';
import 'package:trucks/data/Provider/image_picker.dart';
import 'package:trucks/data/Provider/user.dart';
import 'package:trucks/user/user_dashbaord.dart';
import 'package:trucks/utils/Wigets/widgets.dart';
import 'package:trucks/utils/constant.dart';

class Uploadvideo extends StatefulWidget {
  var truckDetails;
  Uploadvideo({Key? key, required this.truckDetails}) : super(key: key);

  @override
  _UploadvideoState createState() => _UploadvideoState();
}

class _UploadvideoState extends State<Uploadvideo> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _showBottomSheet = false;
  String videoState = 'Select Video';
  final cloudinary =
      Cloudinary("974695494724179", "caxRl6mWbggYApy88n4Ym9w25MU", "aikaload");

  @override
  Widget build(BuildContext context) {
    final imagePicker = Provider.of<ImagePickerService>(context, listen: false);
    final user = Provider.of<Users>(context, listen: false);

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
              const Padding(
                padding: EdgeInsets.only(right: 36.0),
                child: Text(
                  'Upload a video of your truck',
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
                'Upload size 50mb max',
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
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () async {
                          await imagePicker.pickImage(
                              context, MediaQuery.of(context).size);
                          if (imagePicker.pickedFile.path != "") {
                            setState(() {
                              videoState = 'Video Selected';
                            });

                            loadingDialog(context, "Uploading... please wait");
                            final response = await cloudinary.uploadFile(
                                filePath: imagePicker.pickedFile.path,
                                resourceType: CloudinaryResourceType.video,
                                
                                folder:
                                    "users/${user.user.userId}/trucks/${widget.truckDetails['truckId']}",
                                fileName: "truckVideo");

                            print(
                                "response from cloudinary ${response.secureUrl}");

                            if (response.isSuccessful) {
                              //Do something else
                              print("response from cloudinary $response");
                              widget.truckDetails['truckVideos'] =
                                  response.secureUrl;
                              Navigator.pop(context);
                            } else {
                              print(
                                  "response from cloudinary  ERROR${response.error}");
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: Center(
                            child: Image.asset('assets/images/upload.png'))),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          videoState,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: videoState == 'Select Video'
                                ? Constant.blue_color
                                : Colors.green,
                            fontStyle: FontStyle.italic,
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
                          "Done",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onPressed: () async {
                          loadingDialog(context, "please wait");
                          print(_showBottomSheet);

                          widget.truckDetails['createdBy'] = user.user.userId;
                          widget.truckDetails['verificationStatus'] =
                              'verified';
                          widget.truckDetails['truckModelId'] = 1;
                          widget.truckDetails['truckTypeId'] = 1;

                          print(widget.truckDetails);

                          var result = await createTruck(
                            airConditioner:
                                widget.truckDetails['hasAirConditioner'],
                            createdBy: widget.truckDetails['createdBy'],
                            description:
                                widget.truckDetails['truckDescription'],
                            location: widget.truckDetails['truckLocation'],
                            plateNumber: widget.truckDetails['truckPlate'],
                            transmission: widget.truckDetails['transmission'],
                            truckModelId: widget.truckDetails['truckModelId'],
                            truckName: widget.truckDetails['truckName'],
                            truckTypeId: widget.truckDetails['truckTypeId'],
                            truckVideos: widget.truckDetails['truckVideos'],
                            truckSize: widget.truckDetails['truckSize'],
                            truckStatus: 1,
                            truckYear: widget.truckDetails['truckYear'],
                            verificationStatus:
                                widget.truckDetails['verificationStatus'],
                          );
                          if (result['error'] == false) {
                            Navigator.pop(context);
                            setState(() {
                              _showBottomSheet = true;
                            });
                          } else {
                            Navigator.pop(context);
                            openDialog(context, "Truck Creation",
                                "${result['message']}", () {
                              Navigator.pop(context);
                            });
                          }
                          // _showBottomSheet = !_showBottomSheet;
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
      ),
      bottomSheet: _showBottomSheet ? _bottomSheet() : null,
    );
  }

  Container _bottomSheet() {
    return Container(
      height: 450,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        elevation: 2,
        child: Container(
          color: Colors.white,
          height: 30,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset('assets/images/check.png'),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    'Your Truck was added successfully',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Constant.blue_color,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
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
                      "View Trucks",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    onPressed: () async {
                      //navigate to home
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDashbaord(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
