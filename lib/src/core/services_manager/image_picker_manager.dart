import 'dart:io';

abstract class ImagePickerManager{

  Future<File?> getImageFromCamera();

  Future<File?> getImageFromGallery();

}