import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/core/services_manager/file_picker_manager.dart';
import 'package:flutter_civix/src/core/services_manager/image_picker_manager.dart';
import 'package:flutter_civix/src/core/utils/utils.dart';

part 'write_statement_fgr_state.dart';

class WriteStatementFgrCubit extends Cubit<WriteStatementFgrState> {
  final ImagePickerManager _imagePicker;
  final FilePickerManager _filePickerManager;
  final Directory _directory;

  WriteStatementFgrCubit(
      this._imagePicker, this._filePickerManager, this._directory)
      : super(WriteStatementFgrState.initial());

  final u = Utils();
  List<File> _files = [];

  Future<void> getImageFormCamera() async {
    final String _newDirectory = '${_directory.path}/AppPictures';
    await Directory(_newDirectory).create(recursive: true);

    final response = await _imagePicker.getImageFromCamera();

    response.fold(
      (errorOrCancel) {
        emit(state.copyWith(
            stateOfFiles: state.stateOfFiles
                .copyWith(error: errorOrCancel)));
      },
      (file) async {
        emit(state.copyWith(
            stateOfFiles: FileListState(
                isLoading: true, pickedFiles: _files, done: false)));
        /**
         * If size of image is more than 1 MB, compress image
         **/
        var nameFile = file.path.split('/').last.split('.').first;
        if (file.readAsBytesSync().lengthInBytes / 1024 / 1024 > 1) {
          final image =
              await u.compressImage(file, '$_newDirectory/$nameFile.webp');

          image.fold((error) {
            emit(state.copyWith(
                stateOfFiles: state.stateOfFiles
                    .copyWith(isLoading: false, error: error)));
          }, (imageCompress) async {
            _files.add(imageCompress);
            file.delete(recursive: true);
          });
        } else {
          _files.add(file);
        }
        emit(state.copyWith(
            stateOfFiles: FileListState(
                isLoading: false, pickedFiles: _files, done: true)));
      },
    );
  }

  Future<void> deleteFile(int index) async {
    _files.removeAt(index);
    _files[index].delete(recursive: true);
    emit(state.copyWith(
        stateOfFiles:
            FileListState(isLoading: false, pickedFiles: _files, done: false)));
  }
}
// await Future.delayed(Duration(seconds: 5));
