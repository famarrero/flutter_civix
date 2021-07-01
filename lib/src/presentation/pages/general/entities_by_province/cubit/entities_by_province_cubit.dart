import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/data/models/general/province_model.dart';
import 'package:flutter_civix/src/domain/repositories/local_assets_repository.dart';

part 'entities_by_province_state.dart';

class EntitiesByProvinceCubit extends Cubit<EntitiesByProvinceState> {
  final LocalAssetsRepository _localAssets;

  EntitiesByProvinceCubit(this._localAssets)
      : super(EntitiesByProvinceState.initial());

  Future<void> getEntitiesByProvince(String entitiesByProvinceJson) async {
    emit(state.copyWith(loading: true, entitiesByProvince: []));
    // await Future.delayed(Duration(seconds: 5));
    var provincesResponse = await _localAssets.loadEntitiesByProvince(entitiesByProvinceJson);
    List<ProvinceModel> entitiesByProvince = provincesResponse.provincesList.toList();
    emit(state.copyWith(loading: false, entitiesByProvince: entitiesByProvince));
  }
}
