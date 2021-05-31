import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/core/services_manager/file_picker_manager.dart';
import 'package:flutter_civix/src/core/services_manager/image_picker_manager.dart';
import 'package:flutter_civix/src/core/utils/utils.dart';
import 'package:built_collection/built_collection.dart';

part 'write_statement_fgr_state.dart';

class WriteStatementFgrCubit extends Cubit<WriteStatementFgrState> {
  final ImagePickerManager _imagePicker;
  final FilePickerManager _filePicker;
  final Directory _directory;

  WriteStatementFgrCubit(this._imagePicker, this._filePicker, this._directory)
      : super(WriteStatementFgrState.initial());

  final u = Utils();
  BuiltList<File> _files = BuiltList([]);
  List<String> _documentsSupportedList = ['pdf', 'doc', 'xlsx', 'txt'];

  Future<void> getImageFormCameraOrGallery({required String source}) async {
    emit(state.copyWith(
        stateOfFiles: FileListState(
            isLoading: false, pickedFiles: _files, done: false, error: null)));

    final String _newDirectory = '${_directory.path}/AppPictures';
    await Directory(_newDirectory).create(recursive: true);

    final Either<String, File> response;
    if (source == 'camera') {
      response = await _imagePicker.getImageFromCamera();
    } else {
      response = await _imagePicker.getImageFromGallery();
    }

    response.fold(
      (errorOrCancel) {
        emit(state.copyWith(
            stateOfFiles: state.stateOfFiles.copyWith(error: errorOrCancel)));
      },
      (file) async {
        emit(state.copyWith(
            stateOfFiles: FileListState(
                isLoading: true, pickedFiles: _files, done: false)));

        var nameFile = file.path.split('/').last.split('.').first;
        int quality = 75;
        /**
         * If size of image is more than 1 MB, compress image
         **/
        if (file.readAsBytesSync().lengthInBytes / 1024 / 1024 > 1) {
          quality = 50;
        }
        final imageCompressResponse = await u.compressImage(
            file, '$_newDirectory/$nameFile.webp', quality);
        imageCompressResponse.fold((error) {
          emit(state.copyWith(
              stateOfFiles:
                  state.stateOfFiles.copyWith(isLoading: false, error: error)));
        }, (imageCompress) async {
          // var builder = _files.toBuilder();
          // builder.add(imageCompress);
          // _files = builder.build();

          _files = (_files.toBuilder()..add(imageCompress)).build();

          file.delete(recursive: true);
        });

        emit(state.copyWith(
            stateOfFiles: FileListState(
                isLoading: false, pickedFiles: _files, done: true)));
      },
    );
  }

  Future<void> getDocument() async {
    emit(state.copyWith(
        stateOfFiles: FileListState(
            isLoading: false, pickedFiles: _files, done: false, error: null)));

    final String _newDirectory = '${_directory.path}/AppDocuments';
    await Directory(_newDirectory).create(recursive: true);

    final response =
        await _filePicker.getSingleFileByExtensions(_documentsSupportedList);

    response.fold(
      (errorOrCancel) {
        emit(state.copyWith(
            stateOfFiles: state.stateOfFiles.copyWith(error: errorOrCancel)));
      },
      (file) async {
        if (_documentsSupportedList.contains(file.path.split('.').last)) {
          emit(state.copyWith(
              stateOfFiles: FileListState(
                  isLoading: true, pickedFiles: _files, done: false)));

          // var builder = _files.toBuilder();
          // builder.add(file);
          // _files = builder.build();

          _files = (_files.toBuilder()..add(file)).build();

          emit(state.copyWith(
              stateOfFiles: FileListState(
                  isLoading: false, pickedFiles: _files, done: true)));
        } else {
          emit(state.copyWith(
              stateOfFiles: state.stateOfFiles.copyWith(
                  isLoading: false,
                  error:
                      'The file selected is not a document or is not supported')));
        }
      },
    );
  }

  Future<void> deleteFile(int index) async {
    await _files[index].delete(recursive: true);

    // var builder = _files.toBuilder();
    // builder.removeAt(index);
    // _files = builder.build();

    _files = (_files.toBuilder()..removeAt(index)).build();

    emit(state.copyWith(
        stateOfFiles: state.stateOfFiles
            .copyWith(isLoading: false, pickedFiles: _files, done: false)));
  }
}
// await Future.delayed(Duration(seconds: 5));
