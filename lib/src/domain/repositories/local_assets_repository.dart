import 'package:flutter_civix/src/data/models/contact_us/contact_us_response_model.dart';
import 'package:flutter_civix/src/data/models/entity/entities_response_model.dart';
import 'package:flutter_civix/src/data/models/faq/faq_response_model.dart';
import 'package:flutter_civix/src/data/models/general/provinces_response_model.dart';
import 'package:flutter_civix/src/data/models/informative_texts/informative_texts_response_model.dart';

abstract class LocalAssetsRepository {
  Future<ProvincesResponseModel> loadProvincesJson();

  Future<FaqResponseModel> loadFaqJson(String faqJson);

  Future<InformativeTextsResponseModel> loadInformativeTextsJson(
      String informativeTextsJson);

  Future<ProvincesResponseModel> loadEntitiesByProvince(
      String provincesWithEntitiesJson);

  Future<EntitiesResponseModel> loadEntitiesList(String entitiesListJson);

  Future<ContactUsResponseModel> loadContactUsJson(String contactUsJson);
}
