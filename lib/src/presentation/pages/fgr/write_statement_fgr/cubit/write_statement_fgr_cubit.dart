import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/core/services_manager/image_picker_manager.dart';

part 'write_statement_fgr_state.dart';

class WriteStatementFgrCubit extends Cubit<WriteStatementFgrState> {
  final ImagePickerManager _imagePicker;

  WriteStatementFgrCubit(this._imagePicker)
      : super(WriteStatementFgrState.initial());

  List<File> _files = [];

  Future<void> getImageFormCamera() async {
    final response = await _imagePicker.getImageFromCamera();
    emit(state.copyWith(
        stateOfFiles:
            FileListState(isLoading: true, pickedFiles: _files, done: false)));
    if (response != null) {
      await Future.delayed(Duration(seconds: 5));
      _files.add(response);
      print(response.path);
    } else {
      emit(state.copyWith(
          stateOfFiles: FileListState(
              isLoading: false,
              pickedFiles: _files,
              done: false,
              error: 'No image tacked')));
    }
    emit(state.copyWith(
        stateOfFiles:
            FileListState(isLoading: false, pickedFiles: _files, done: true)));
  }

  Future<void> deleteFile(int index) async {
    _files.removeAt(index);
    emit(state.copyWith(
        stateOfFiles:
            FileListState(isLoading: false, pickedFiles: _files, done: false)));
  }
}
