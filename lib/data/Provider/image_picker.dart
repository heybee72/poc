import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService with ChangeNotifier {
  final imagePicker = ImagePicker();
  bool withCamera = false;
  bool cancel = false;

  File pickedFile = File("");
  // Returns a [File] object pointing to the image that was picked.
  Future pickImage(context, size) async {
    try {
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return SizedBox(
              height: 200,
              width: 200,
              child: AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                content: SizedBox(
                  height: 100,
                  width: 100,
                  child: ListView(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      ListTile(
                          title: const Text("Upload using Camera"),
                          trailing: const Icon(Icons.camera),
                          onTap: () {
                            withCamera = true;
                            cancel = false;
                            Navigator.pop(context);
                          }),
                      ListTile(
                          title: const Text("Upload from Gallary"),
                          trailing: const Icon(Icons.grid_view_sharp),
                          onTap: () {
                            withCamera = false;
                            cancel = false;
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
                title: const Text("Do you want to get from Camera or Gallary?"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        cancel = true;
                      },
                      child: const Text('Cancel'))
                ],
              ),
            );
          });
      if (cancel == true) return;
      final pickedImage = withCamera
          ? await imagePicker.pickVideo(
              source: ImageSource.camera, maxDuration: Duration(seconds: 20))
          : await imagePicker.pickVideo(
              source: ImageSource.gallery, maxDuration: Duration(seconds: 20));

      if (pickedImage == null) return;

      final tempImage = File(pickedImage.path);
      this.pickedFile = tempImage;
      // final pickedFile = await imagePicker.pickImage(
      //     source: ImageSource.gallery, imageQuality: 20);
      // final imageTemporary = File(pickedFile!.path);
      // this.pickedFile = imageTemporary;
      notifyListeners();

      print("IMAGE PATH: " + pickedFile.path.toString());
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }
}
