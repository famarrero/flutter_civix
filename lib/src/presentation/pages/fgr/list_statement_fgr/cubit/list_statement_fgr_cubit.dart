import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/domain/repositories/database_fgr_repository.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';

part 'list_statement_fgr_state.dart';

class ListStatementFgrCubit extends Cubit<ListStatementFgrState> {
  final DataBaseFGRRepository _dataBaseFGRRepository;

  ListStatementFgrCubit(this._dataBaseFGRRepository) : super(ListStatementFgrState.initial());

  Future<void> whatchAllStatmentFgr() async {
    Stream<List<StatementFGR>> statmentsFgr = _dataBaseFGRRepository.watchAllStatementsFGR();

    emit(state.copyWith(statmentsFgr: statmentsFgr));
  }

  Future<void> deleteAllStatementFGR() async {
    await _dataBaseFGRRepository.deleteAllStatementFGR();
  }
}
