part of 'informative_texts_cubit.dart';

class InformativeTextsState extends Equatable {
  final bool loading;
  final InformativeTextsResponseModel? informativeText;

  const InformativeTextsState({required this.informativeText, required this.loading});

  factory InformativeTextsState.initial() =>
      InformativeTextsState(informativeText: null, loading: false);

  InformativeTextsState copyWith(
      {InformativeTextsResponseModel? informativeText, bool? loading}) {
    return InformativeTextsState(
        informativeText: informativeText ?? this.informativeText, loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [informativeText, loading];
}
