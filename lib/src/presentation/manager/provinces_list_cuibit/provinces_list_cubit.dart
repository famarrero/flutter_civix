import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/data/models/province_model.dart';
import 'package:flutter_civix/src/data/repositories/local_assets.dart';

part 'provinces_list_state.dart';

class ProvincesListCubit extends Cubit<ProvincesListState> {
  final LocalAssets _localAssets;

  ProvincesListCubit(this._localAssets) : super(ProvincesListState.initial());

  Future<void> getProvinces() async {
    var provincesResponse = await _localAssets.loadProvincesJson();
    List<ProvinceModel> provincesList =
        provincesResponse.provincesList.toList();
    emit(state.copyWith(provinceList: provincesList));
  }
}
