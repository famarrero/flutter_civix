import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_civix/src/core/services_manager/file_picker_manager.dart';

//todo add plist to iOS module
class FilePickerManagerImpl implements FilePickerManager {
  @override
  Future<Either<String, File>> getSingleFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        return right(File(result.files.single.path!));
      } else {
        return left('No file selected');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<File>>> getMultiplesFiles() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null) {
        return right(result.paths.map((path) => File(path!)).toList());
      } else {
        return left('No file selected');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<File>>> getMultiplesFilesByExtensions(
      List<String> extensions) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          type: FileType.custom,
          allowedExtensions: extensions);

      if (result != null) {
        return right(result.paths.map((path) => File(path!)).toList());
      } else {
        return left('No file selected');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, File>> getSingleFileByExtensions(
      List<String> extensions) async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: extensions);

      if (result != null) {
        return right(File(result.files.first.path!));
      } else {
        return left('No file selected');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
