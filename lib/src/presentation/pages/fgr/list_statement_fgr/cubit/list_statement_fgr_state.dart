part of 'list_statement_fgr_cubit.dart';

class ListStatementFgrState extends Equatable {
  final Stream<List<StatementFGR>> statmentsFgr;
  final String? error;

  const ListStatementFgrState({required this.statmentsFgr, this.error});

  factory ListStatementFgrState.initial(
          {Stream<List<StatementFGR>>? statmentsFgr, String? error}) =>
      ListStatementFgrState(
        statmentsFgr: statmentsFgr ?? Stream<List<StatementFGR>>.empty(),
        error: error ?? null,
      );

  ListStatementFgrState copyWith(
      {bool? isLoading, Stream<List<StatementFGR>>? statmentsFgr, String? error}) {
    return ListStatementFgrState(
      statmentsFgr: statmentsFgr ?? this.statmentsFgr,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [statmentsFgr, error];
}
