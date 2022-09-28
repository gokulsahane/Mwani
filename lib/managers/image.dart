import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

// crop image
Future<File?> cropImage({required File imageFile}) async {
  File? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Customize',
          dimmedLayerColor: Colors.black.withOpacity(0.2),
          hideBottomControls: false,
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.ratio16x9,
          lockAspectRatio: false),
      iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1.0, aspectRatioLockEnabled: false));
  if (croppedFile != null) {
    return croppedFile;
  } else {
    return null;
  }
}