part of 'consult_state_fgr_cubit.dart';

class ConsultStateFgrState extends Equatable {
  final bool loading;
  final bool showForm;
  final StatementResponseConsult? statementsResponseConsult;
  final String? error;

  const ConsultStateFgrState(
      {required this.loading,
      required this.showForm,
      this.statementsResponseConsult,
      this.error});

  factory ConsultStateFgrState.initial(
          {bool? loading,
          bool? showForm,
          StatementResponseConsult? statementsResponseConsult,
          String? error}) =>
      ConsultStateFgrState(
        loading: loading ?? false,
        showForm: showForm ?? true,
        statementsResponseConsult: statementsResponseConsult ?? null,
        error: error ?? null,
      );

  ConsultStateFgrState copyWith(
      {bool? loading,
      bool? showForm,
      StatementResponseConsult? statementsResponseConsult,
      String? error}) {
    return ConsultStateFgrState(
      loading: loading ?? this.loading,
      showForm: showForm ?? this.showForm,
      statementsResponseConsult:
      statementsResponseConsult ?? this.statementsResponseConsult,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props =>
      [loading, showForm, statementsResponseConsult, error];
}
