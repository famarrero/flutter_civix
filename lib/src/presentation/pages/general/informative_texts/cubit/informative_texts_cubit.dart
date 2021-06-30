import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/data/models/informative_texts/informative_texts_response_model.dart';
import 'package:flutter_civix/src/domain/repositories/local_assets_repository.dart';

part 'informative_texts_state.dart';

class InformativeTextsCubit extends Cubit<InformativeTextsState> {
  final LocalAssetsRepository _localAssets;

  InformativeTextsCubit(this._localAssets)
      : super(InformativeTextsState.initial());

  Future<void> getInformativeText(String jsonInformativeTexts) async {
    emit(state.copyWith(loading: true, informativeText: null));
    // await Future.delayed(Duration(seconds: 5));
    InformativeTextsResponseModel informativeTextResponse =
        await _localAssets.loadInformativeTextsJson(jsonInformativeTexts);
    emit(state.copyWith(
        loading: false, informativeText: informativeTextResponse));
  }
}
