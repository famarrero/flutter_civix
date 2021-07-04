import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_civix/src/core/failure/failures.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class Utils {
  ///
  /// Compress image and convert to .webp format
  ///
  Future<Either<Failure, File>> compressImage(
      File file, String targetPath, int quality) async {
    try {
      var result = await FlutterImageCompress.compressAndGetFile(
          file.absolute.path, targetPath,
          format: CompressFormat.webp, quality: quality);
      if (result != null) {
        return right(result);
      } else {
        return left(ImageCompressFailure(S.current.errorCompressingImage));
      }
    } catch (e) {
      return left(ImageCompressFailure(e.toString()));
    }
  }

  ///
  /// Get size of file like (1.5 KB, 4.3 MG)
  ///
  String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }
}
