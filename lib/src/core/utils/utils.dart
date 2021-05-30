
import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class Utils {
  Future<Either<String, File>> compressImage(
      File file, String targetPath) async {
    try {
      var result = await FlutterImageCompress.compressAndGetFile(
          file.absolute.path, targetPath,
          format: CompressFormat.webp, quality: 50);
      if (result != null) {
        return right(result);
      } else {
        return left('Error compressing image');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }
}
