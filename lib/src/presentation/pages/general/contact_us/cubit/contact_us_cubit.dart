import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/data/models/contact_us/contact_us_response_model.dart';
import 'package:flutter_civix/src/domain/repositories/local_assets_repository.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final LocalAssetsRepository _localAssets;

  ContactUsCubit(this._localAssets)
      : super(ContactUsState.initial());

  Future<void> getContactUs(String jsonContactUs) async {
    emit(state.copyWith(loading: true, contactUs: null));
    // await Future.delayed(Duration(seconds: 5));
    ContactUsResponseModel contactUs =
        await _localAssets.loadContactUsJson(jsonContactUs);
    emit(state.copyWith(
        loading: false, contactUs: contactUs));
  }
}
