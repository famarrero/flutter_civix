import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_civix/src/core/failure/failures.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';

abstract class FilePickerManager {
  Future<Either<Failure, Uint8List>> getSingleImageUint8List();

  Future<Either<Failure, File>> getSingleImage();

  Future<Either<Failure, List<File>>> getMultiplesImages();

  Future<Either<Failure, File>> getSingleFile();

  Future<Either<Failure, List<File>>> getMultiplesFiles();

  Future<Either<Failure, File>> getSingleFileByExtensions(List<String> extensions);

  Future<Either<Failure, List<File>>> getMultiplesFilesByExtensions(List<String> extensions);
}

class FilePickerManagerImpl implements FilePickerManager {
  @override
  Future<Either<Failure, Uint8List>> getSingleImageUint8List() async {
    try {
      final FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);

      if (result != null) {
        return right(result.files.single.bytes!);
      } else {
        return left(CancelFilePickerFailure(S.current.noFileSelected));
      }
    } catch (e) {
      return left(FilePickerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, File>> getSingleImage() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

      if (result != null) {
        return right(File(result.files.single.path!));
      } else {
        return left(CancelFilePickerFailure(S.current.noFileSelected));
      }
    } catch (e) {
      return left(FilePickerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<File>>> getMultiplesImages() async {
    try {
      final FilePickerResult? result =
      await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.image);

      if (result != null) {
        return right(result.paths.map((path) => File(path!)).toList());
      } else {
        return left(CancelFilePickerFailure(S.current.noFileSelected));
      }
    } catch (e) {
      return left(FilePickerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, File>> getSingleFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        return right(File(result.files.single.path!));
      } else {
        return left(CancelFilePickerFailure(S.current.noFileSelected));
      }
    } catch (e) {
      return left(FilePickerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, File>> getSingleFileByExtensions(List<String> extensions) async {
    try {
      final FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: extensions);

      if (result != null) {
        return right(File(result.files.first.path!));
      } else {
        return left(CancelFilePickerFailure(S.current.noFileSelected));
      }
    } catch (e) {
      return left(FilePickerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<File>>> getMultiplesFiles() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null) {
        return right(result.paths.map((path) => File(path!)).toList());
      } else {
        return left(CancelFilePickerFailure(S.current.noFileSelected));
      }
    } catch (e) {
      return left(FilePickerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<File>>> getMultiplesFilesByExtensions(List<String> extensions) async {
    try {
      final FilePickerResult? result = await FilePicker.platform
          .pickFiles(allowMultiple: true, type: FileType.custom, allowedExtensions: extensions);

      if (result != null) {
        return right(result.paths.map((path) => File(path!)).toList());
      } else {
        return left(CancelFilePickerFailure(S.current.noFileSelected));
      }
    } catch (e) {
      return left(FilePickerFailure(e.toString()));
    }
  }
}