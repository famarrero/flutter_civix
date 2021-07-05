import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_civix/src/core/failure/failures.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerManager {
  Future<Either<Failure, File>> getImageFromCamera();

  Future<Either<Failure, File>> getImageFromGallery();
}

class ImagePickerManagerImpl implements ImagePickerManager {
  final picker = ImagePicker();

  @override
  Future<Either<Failure, File>> getImageFromCamera() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return right(File(pickedFile.path));
      } else {
        return left(CancelFilePickerFailure(S.current.noImageTaken));
      }
    } catch (e) {
      return left(FilePickerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, File>> getImageFromGallery() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return right(File(pickedFile.path));
      } else {
        return left(CancelFilePickerFailure(S.current.noImageSelected));
      }
    } catch (e) {
      return left(FilePickerFailure(e.toString()));
    }
  }
}

// import 'dart:io';
//
// import 'package:dartz/dartz.dart';
// import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
// import 'package:image_picker/image_picker.dart';
//
// abstract class ImagePickerManager {
//   Future<Either<String, File>> getImageFromCamera();
//
//   Future<Either<String, File>> getImageFromGallery();
// }
//
// class ImagePickerManagerImpl implements ImagePickerManager {
//   final picker = ImagePicker();
//
//   @override
//   Future<Either<String, File>> getImageFromCamera() async {
//     try {
//       final pickedFile = await picker.getImage(source: ImageSource.camera);
//       if (pickedFile != null) {
//         return right(File(pickedFile.path));
//       } else {
//         return left(S.current.noImageTaked);
//       }
//     } catch (e) {
//       return left(e.toString());
//     }
//   }
//
//   @override
//   Future<Either<String, File>> getImageFromGallery() async {
//     try {
//       final pickedFile = await picker.getImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         return right(File(pickedFile.path));
//       } else {
//         return left(S.current.noImageSelected);
//       }
//     } catch (e) {
//       return left(e.toString());
//     }
//   }
// }
