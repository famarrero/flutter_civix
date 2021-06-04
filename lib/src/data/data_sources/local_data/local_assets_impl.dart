import 'package:flutter/services.dart';
import 'package:flutter_civix/src/data/models/provinces_response_model.dart';
import 'package:flutter_civix/src/data/repositories/local_assets.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';

class LocalAssetsImpl implements LocalAssets {
  @override
  Future<ProvincesResponseModel> loadProvincesJson() async {
     String provincesJsonString = await rootBundle.loadString(Assets.jsons.provinces);
     ProvincesResponseModel  provincesResponseModel =  ProvincesResponseModel.fromJson(provincesJsonString)!;
     return provincesResponseModel;
  }
}
