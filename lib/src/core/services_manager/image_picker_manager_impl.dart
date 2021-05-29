import 'dart:io';

import 'package:flutter_civix/src/core/services_manager/image_picker_manager.dart';
import 'package:image_picker/image_picker.dart';

//todo add plist to ios module
class ImagePickerManagerImpl implements ImagePickerManager {
  final picker = ImagePicker();

  @override
  Future<File?> getImageFromCamera() async {
    File? image;
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image tacked');
      image = null;
    }
    return image;
  }

  @override
  Future<File?> getImageFromGallery() async {
    File? image;
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected');
      image = null;
    }
    return image;
  }
}
