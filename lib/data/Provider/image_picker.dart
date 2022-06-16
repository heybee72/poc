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
      final pickedImage = await imagePicker.pickVideo(
        source: ImageSource.camera,
        maxDuration: const Duration(seconds: 20),
      );

      if (pickedImage == null) return;

      final tempImage = File(pickedImage.path);
      pickedFile = tempImage;
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
