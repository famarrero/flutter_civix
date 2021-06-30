import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_civix/src/data/models/informative_texts/texts_model.dart';

part 'informative_texts_response_model.g.dart';

abstract class InformativeTextsResponseModel
    implements Built<InformativeTextsResponseModel, InformativeTextsResponseModelBuilder> {
  InformativeTextsResponseModel._();

  factory InformativeTextsResponseModel([void Function(InformativeTextsResponseModelBuilder) updates]) =
      _$InformativeTextsResponseModel;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'texts_list')
  BuiltList<TextsModel> get textsList;

  String toJson() {
    return json.encode(serializers.serializeWith(InformativeTextsResponseModel.serializer, this));
  }

  static InformativeTextsResponseModel? fromJson(String jsonString) {
    return serializers.deserializeWith(InformativeTextsResponseModel.serializer, json.decode(jsonString));
  }

  static InformativeTextsResponseModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(InformativeTextsResponseModel.serializer, map);
  }

  static Serializer<InformativeTextsResponseModel> get serializer => _$informativeTextsResponseModelSerializer;
}
