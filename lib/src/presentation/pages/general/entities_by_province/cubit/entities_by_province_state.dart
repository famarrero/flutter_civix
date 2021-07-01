part of 'entities_by_province_cubit.dart';

class EntitiesByProvinceState extends Equatable {
  final bool loading;
  final List<ProvinceModel> entitiesByProvince;

  const EntitiesByProvinceState(
      {required this.entitiesByProvince, required this.loading});

  factory EntitiesByProvinceState.initial() =>
      EntitiesByProvinceState(entitiesByProvince: [], loading: false);

  EntitiesByProvinceState copyWith(
      {List<ProvinceModel>? entitiesByProvince, bool? loading}) {
    return EntitiesByProvinceState(
        entitiesByProvince: entitiesByProvince ?? this.entitiesByProvince,
        loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [entitiesByProvince, loading];
}
