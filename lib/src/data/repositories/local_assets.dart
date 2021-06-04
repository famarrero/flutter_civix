import 'package:flutter_civix/src/data/models/provinces_response_model.dart';

abstract class LocalAssets {
  Future<ProvincesResponseModel> loadProvincesJson();
}
