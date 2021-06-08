part of 'show_statement_fgr_cubit.dart';

class ShowStatementFgrState extends Equatable {
  final Stream<StatementFGR?> statmentsFgr;
  final String? error;

  const ShowStatementFgrState({required this.statmentsFgr, this.error});

  factory ShowStatementFgrState.initial(
          {bool? isSending, Stream<StatementFGR?>? statmentsFgr, String? error}) =>
      ShowStatementFgrState(
        statmentsFgr: statmentsFgr ?? Stream.empty(),
        error: error ?? null,
      );

  ShowStatementFgrState copyWith(
      {Stream<StatementFGR?>? statmentsFgr, String? error}) {
    return ShowStatementFgrState(
      statmentsFgr: statmentsFgr ?? this.statmentsFgr,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [statmentsFgr, error];
}
