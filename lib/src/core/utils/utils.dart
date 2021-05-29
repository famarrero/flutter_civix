import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class Utils {
  Future<File?> compressImage(File file, String targetPath) async {
    try {
      var result = await FlutterImageCompress.compressAndGetFile(
          file.absolute.path, targetPath,
          quality: 50);
      return result;
    } catch (e) {
      print('Compress error: $e');
    }
  }
}
