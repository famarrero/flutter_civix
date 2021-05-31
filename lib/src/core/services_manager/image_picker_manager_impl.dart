import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_civix/src/core/services_manager/image_picker_manager.dart';
import 'package:image_picker/image_picker.dart';

//todo add plist to ios module
class ImagePickerManagerImpl implements ImagePickerManager {
  final picker = ImagePicker();

  @override
  Future<Either<String, File>> getImageFromCamera() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return right(File(pickedFile.path));
      } else {
        return left('No image tacked');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, File>> getImageFromGallery() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return right(File(pickedFile.path));
      } else {
        print('No image selected');
        return left('No image selected');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
