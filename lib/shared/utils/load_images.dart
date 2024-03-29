import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload {
  static Future<File?> selectImage(
      ImageSource imageSource, BuildContext context) async {
    File? imageFile;
    final pickedFile = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    return imageFile;
  }
}

class ImageUploadMultiple {
  static List<XFile>? pickedFiles;
  static List<File>? imageFiles;

  static Future<List<File>?> selectImages(BuildContext context) async {
    pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles != null) {
      if (pickedFiles != null) {
        if (pickedFiles!.length > 10) {
          pickedFiles = pickedFiles!.sublist(0, 10);
        }
      }
      imageFiles =
          pickedFiles?.map((pickedFile) => File(pickedFile.path)).toList();
    }
    return imageFiles;
  }
}
