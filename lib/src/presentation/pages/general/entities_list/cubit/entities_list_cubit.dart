import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/data/models/entity/entity_model.dart';
import 'package:flutter_civix/src/domain/repositories/local_assets_repository.dart';

part 'entities_list_state.dart';

class EntitiesListCubit extends Cubit<EntitiesListState> {
  final LocalAssetsRepository _localAssets;

  EntitiesListCubit(this._localAssets) : super(EntitiesListState.initial());

  Future<void> getEntitiesByProvince(String entitiesListJson) async {
    emit(state.copyWith(loading: true, entitiesList: []));
    // await Future.delayed(Duration(seconds: 5));
    var entitiesResponseModel =
        await _localAssets.loadEntitiesList(entitiesListJson);
    List<EntityModel> entitiesList =
        entitiesResponseModel.entitiesList.toList();
    emit(state.copyWith(loading: false, entitiesList: entitiesList));
  }
}
