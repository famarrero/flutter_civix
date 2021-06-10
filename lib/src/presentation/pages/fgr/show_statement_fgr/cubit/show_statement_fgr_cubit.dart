import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/domain/repositories/database_fgr_repository.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';

part 'show_statement_fgr_state.dart';

class ShowStatementFgrCubit extends Cubit<ShowStatementFgrState> {
  final DataBaseFGRRepository _dataBaseFGRRepository;

  ShowStatementFgrCubit(this._dataBaseFGRRepository)
      : super(ShowStatementFgrState.initial());

  Future<void> watchStatementFGRById(String ticked) async {
    Stream<StatementFGR?> statementsFgr =
        _dataBaseFGRRepository.watchStatementFGRById(ticked);

    // emit(state.copyWith(statmentsFgr: statementsFgr));
  }

  Future<void> getStatementFGRById(String ticked) async {
    StatementFGR? statementsFgr =
        await _dataBaseFGRRepository.getStatementFGRById(ticked);

    if (statementsFgr != null) {
      var checkedFiles = await _checkIfFilesExists(statementsFgr.files!);
      emit(state.copyWith(

          // statementsFgr: statementsFgr.copyWith(files: checkedFiles)));
          statementsFgr: statementsFgr));

    } else {
      emit(state.copyWith(statementsFgr: null));
    }
  }

  Future<List<File>> _checkIfFilesExists(List<File> files) async {
    List<File> _files = [];

    for (var file in files) {
      if (await file.exists()) {
        _files.add(file);
      }
    }
    return _files;
  }
}