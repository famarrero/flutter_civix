import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class FilePickerManager {
  Future<Either<String, File>> getSingleFile();

  Future<Either<String, File>> getSingleFileByExtensions(List<String> extensions);

  Future<Either<String, List<File>>> getMultiplesFiles();

  Future<Either<String, List<File>>> getMultiplesFilesByExtensions(
      List<String> extensions);
}
