import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/domain/repositories/database_fgr_repository.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';

part 'show_statement_fgr_state.dart';

class ShowStatementFgrCubit extends Cubit<ShowStatementFgrState> {
  final DataBaseFGRRepository _dataBaseFGRRepository;

  ShowStatementFgrCubit(this._dataBaseFGRRepository) : super(ShowStatementFgrState.initial());

  Future<void> watchStatementFGRById(String tiked) async {

    Stream<StatementFGR?> statmentsFgr = _dataBaseFGRRepository.watchStatementFGRById(tiked);

    emit(state.copyWith(statmentsFgr: statmentsFgr));
  }
}
