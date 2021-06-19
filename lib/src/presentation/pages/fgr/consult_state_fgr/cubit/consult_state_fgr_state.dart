part of 'consult_state_fgr_cubit.dart';

class ConsultStateFgrState extends Equatable {
  final bool loading;
  final StatementResponseConsult? statmentsResponseConsult;
  final String? error;

  const ConsultStateFgrState({required this.loading, this.statmentsResponseConsult, this.error});

  factory ConsultStateFgrState.initial(
          {bool? loading, StatementResponseConsult? statmentsResponseConsult, String? error}) =>
      ConsultStateFgrState(
        loading: loading ?? false,
        statmentsResponseConsult: statmentsResponseConsult ?? null,
        error: error ?? null,
      );

  ConsultStateFgrState copyWith(
      {bool? loading, StatementResponseConsult? statmentsResponseConsult, String? error}) {
    return ConsultStateFgrState(
      loading: loading ?? this.loading,
      statmentsResponseConsult: statmentsResponseConsult ?? this.statmentsResponseConsult,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [loading, statmentsResponseConsult, error];
}
