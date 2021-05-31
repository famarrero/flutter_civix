import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class ImagePickerManager{

  Future<Either<String, File>> getImageFromCamera();

  Future<Either<String, File>> getImageFromGallery();

}