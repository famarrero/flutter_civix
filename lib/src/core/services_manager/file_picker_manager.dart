import 'dart:io';

abstract class FilePickerManager {
  Future<File?> getSingleFile();

  Future<List<File>?> getMultiplesFiles();

  Future<List<File>?> getFileByExtensions(List<String> extensions);

  Future<List<File>?> getMultiplesFilesByExtensions(List<String> extensions);
}
