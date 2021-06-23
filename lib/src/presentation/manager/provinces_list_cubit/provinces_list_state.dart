part of 'provinces_list_cubit.dart';

class ProvincesListState extends Equatable {
  final List<ProvinceModel> provinceList;

  const ProvincesListState({required this.provinceList});

  factory ProvincesListState.initial() => ProvincesListState(provinceList: []);

  ProvincesListState copyWith({List<ProvinceModel>? provinceList}) {
    return ProvincesListState(
      provinceList: provinceList ?? this.provinceList,
    );
  }

  @override
  List<Object?> get props => [provinceList];
}
