import 'package:flutter/services.dart';
import 'package:flutter_civix/src/data/models/contact_us/contact_us_response_model.dart';
import 'package:flutter_civix/src/data/models/entity/entities_response_model.dart';
import 'package:flutter_civix/src/data/models/faq/faq_response_model.dart';
import 'package:flutter_civix/src/data/models/general/provinces_response_model.dart';
import 'package:flutter_civix/src/data/models/informative_texts/informative_texts_response_model.dart';
import 'package:flutter_civix/src/domain/repositories/local_assets_repository.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';

class LocalAssetsRepositoryImpl implements LocalAssetsRepository {
  @override
  Future<ProvincesResponseModel> loadProvincesJson() async {
    String provincesJsonString =
        await rootBundle.loadString(Assets.jsons.general.provinces);
    ProvincesResponseModel provincesResponseModel =
        ProvincesResponseModel.fromJson(provincesJsonString)!;
    return provincesResponseModel;
  }

  @override
  Future<FaqResponseModel> loadFaqJson(String faqJson) async {
    String jsonString = await rootBundle.loadString(faqJson);
    FaqResponseModel faqResponseModel = FaqResponseModel.fromJson(jsonString)!;
    return faqResponseModel;
  }

  @override
  Future<InformativeTextsResponseModel> loadInformativeTextsJson(
      String informativeTextsJson) async {
    String jsonString = await rootBundle.loadString(informativeTextsJson);
    InformativeTextsResponseModel informativeTextsResponseModel =
        InformativeTextsResponseModel.fromJson(jsonString)!;
    return informativeTextsResponseModel;
  }

  @override
  Future<ProvincesResponseModel> loadEntitiesByProvince(
      String provincesWithEntitiesJson) async {
    String jsonString = await rootBundle.loadString(provincesWithEntitiesJson);
    ProvincesResponseModel provincesWithEntities =
        ProvincesResponseModel.fromJson(jsonString)!;
    return provincesWithEntities;
  }

  @override
  Future<EntitiesResponseModel> loadEntitiesList(
      String entitiesListJson) async {
    String jsonString = await rootBundle.loadString(entitiesListJson);
    EntitiesResponseModel entitiesList =
        EntitiesResponseModel.fromJson(jsonString)!;
    return entitiesList;
  }

  @override
  Future<ContactUsResponseModel> loadContactUsJson(String contactUsJson) async {
    String jsonString = await rootBundle.loadString(contactUsJson);
    ContactUsResponseModel contactUsResponseModel =
    ContactUsResponseModel.fromJson(jsonString)!;
    return contactUsResponseModel;
  }
}
