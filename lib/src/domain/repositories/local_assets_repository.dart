import 'package:flutter_civix/src/data/models/faq/faq_response_model.dart';
import 'package:flutter_civix/src/data/models/general/provinces_response_model.dart';
import 'package:flutter_civix/src/data/models/informative_texts/informative_texts_response_model.dart';

abstract class LocalAssetsRepository {
  Future<ProvincesResponseModel> loadProvincesJson();

  Future<FaqResponseModel> loadFaqJson(String faqJson);

  Future<InformativeTextsResponseModel> loadInformativeTextsJson(
      String informativeTextsJson);
}
