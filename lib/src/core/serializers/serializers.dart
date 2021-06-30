import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_civix/src/data/models/entity/coordinates_model.dart';
import 'package:flutter_civix/src/data/models/entity/entities_response_model.dart';
import 'package:flutter_civix/src/data/models/entity/entity_model.dart';
import 'package:flutter_civix/src/data/models/faq/faq_response_model.dart';
import 'package:flutter_civix/src/data/models/faq/question_model.dart';
import 'package:flutter_civix/src/data/models/faq/response_model.dart';
import 'package:flutter_civix/src/data/models/general/municipality_model.dart';
import 'package:flutter_civix/src/data/models/general/province_model.dart';
import 'package:flutter_civix/src/data/models/general/provinces_response_model.dart';
import 'package:flutter_civix/src/data/models/informative_texts/informative_texts_response_model.dart';
import 'package:flutter_civix/src/data/models/informative_texts/texts_model.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor([
  ProvincesResponseModel,
  ProvinceModel,
  MunicipalityModel,
  FaqResponseModel,
  QuestionModel,
  ResponseModel,
  InformativeTextsResponseModel,
  TextsModel,
  EntityModel,
  CoordinatesModel,
  EntitiesResponseModel
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
    // ..addBuilderFactory(const FullType(BuiltList, [FullType(Todo)]), () => ListBuilder<Todo>())
    )
    .build();

//run this when modify this file
// flutter packages pub run build_runner build
