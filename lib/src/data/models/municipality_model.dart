import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serialaizers/serializers.dart';

part 'municipality_model.g.dart';

abstract class MunicipalityModel
    implements Built<MunicipalityModel, MunicipalityModelBuilder> {
  MunicipalityModel._();

  factory MunicipalityModel([void Function(MunicipalityModelBuilder) updates]) =
      _$MunicipalityModel;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'municipality_name')
  String get municipalityName;

  String toJson() {
    return json
        .encode(serializers.serializeWith(MunicipalityModel.serializer, this));
  }

  static MunicipalityModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        MunicipalityModel.serializer, json.decode(jsonString));
  }

  static MunicipalityModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(MunicipalityModel.serializer, map);
  }

  static Serializer<MunicipalityModel> get serializer =>
      _$municipalityModelSerializer;
}
