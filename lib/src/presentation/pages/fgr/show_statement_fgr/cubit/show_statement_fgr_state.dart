part of 'show_statement_fgr_cubit.dart';

class ShowStatementFgrState extends Equatable {
  // final Stream<StatementFGR?> statmentsFgr;
  final StatementFGR? statementsFgr;
  final String? error;

  const ShowStatementFgrState({required this.statementsFgr, this.error});

  factory ShowStatementFgrState.initial(
          {bool? isSending, StatementFGR? statmentsFgr, String? error}) =>
      ShowStatementFgrState(
        statementsFgr: statmentsFgr ?? null,
        error: error ?? null,
      );

  ShowStatementFgrState copyWith(
      {StatementFGR? statementsFgr, String? error}) {
    return ShowStatementFgrState(
      statementsFgr: statementsFgr ?? this.statementsFgr,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [statementsFgr, error];
}
