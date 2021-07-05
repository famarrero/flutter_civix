part of 'entities_list_cubit.dart';

class EntitiesListState extends Equatable {
  final bool loading;
  final List<EntityModel> entitiesList;

  const EntitiesListState(
      {required this.entitiesList, required this.loading});

  factory EntitiesListState.initial() =>
      EntitiesListState(entitiesList: [], loading: false);

  EntitiesListState copyWith(
      {List<EntityModel>? entitiesList, bool? loading}) {
    return EntitiesListState(
        entitiesList: entitiesList ?? this.entitiesList,
        loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [entitiesList, loading];
}
