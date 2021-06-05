import 'package:flutter/services.dart';
import 'package:flutter_civix/src/data/models/provinces_response_model.dart';
import 'package:flutter_civix/src/domain/repositories/local_assets_repository.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';

class LocalAssetsRepositoryImpl implements LocalAssetsRepository {
  @override
  Future<ProvincesResponseModel> loadProvincesJson() async {
     String provincesJsonString = await rootBundle.loadString(Assets.jsons.provinces);
     ProvincesResponseModel  provincesResponseModel =  ProvincesResponseModel.fromJson(provincesJsonString)!;
     return provincesResponseModel;
  }
}
