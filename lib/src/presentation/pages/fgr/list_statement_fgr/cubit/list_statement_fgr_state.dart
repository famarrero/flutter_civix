part of 'list_statement_fgr_cubit.dart';

class ListStatementFgrState extends Equatable {
  final bool isLoading;
  final Stream<List<StatementFGR>> statmentsFgr;
  final String? error;

  const ListStatementFgrState({required this.isLoading, required this.statmentsFgr, this.error});

  factory ListStatementFgrState.initial(
          {bool? isSending, Stream<List<StatementFGR>>? statmentsFgr, String? error}) =>
      ListStatementFgrState(
        isLoading: isSending ?? false,
        statmentsFgr: statmentsFgr ?? Stream.empty(),
        error: error ?? null,
      );

  ListStatementFgrState copyWith(
      {bool? isSending, Stream<List<StatementFGR>>? statmentsFgr, String? error}) {
    return ListStatementFgrState(
      isLoading: isSending ?? this.isLoading,
      statmentsFgr: statmentsFgr ?? this.statmentsFgr,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, statmentsFgr, error];
}
