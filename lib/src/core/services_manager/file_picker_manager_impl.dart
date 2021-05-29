import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_civix/src/core/services_manager/file_picker_manager.dart';

//todo add plist to ios module
class FilePickerManagerImpl implements FilePickerManager {
  @override
  Future<File?> getSingleFile() async {
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
    } else {
      file = null;
    }
    return file;
  }

  @override
  Future<List<File>?> getMultiplesFiles() async {
    List<File>? files;
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
    } else {
      files = null;
    }
    return files;
  }

  @override
  Future<List<File>?> getMultiplesFilesByExtensions(
      List<String> extensions) async {
    List<File>? files;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: extensions);

    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
    } else {
      files = null;
    }
    return files;
  }

  @override
  Future<List<File>?> getFileByExtensions(List<String> extensions) async {
    List<File>? files;
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: extensions);

    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
    } else {
      files = null;
    }
    return files;
  }
}
