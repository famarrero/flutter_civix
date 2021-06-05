import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serialaizers/serializers.dart';
import 'package:flutter_civix/src/data/models/municipality_model.dart';
import 'package:built_collection/built_collection.dart';

part 'province_model.g.dart';

abstract class ProvinceModel
    implements Built<ProvinceModel, ProvinceModelBuilder> {
  ProvinceModel._();

  factory ProvinceModel([void Function(ProvinceModelBuilder) updates]) =
      _$ProvinceModel;

  @BuiltValueField(wireName: 'province_name')
  String get provinceName;

  @BuiltValueField(wireName: 'province_abbreviation')
  String get provinceAbbreviation;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'municipalities_list')
  BuiltList<MunicipalityModel> get municipalitiesList;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ProvinceModel.serializer, this));
  }

  static ProvinceModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ProvinceModel.serializer, json.decode(jsonString));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(ProvinceModel.serializer, this) as Map<String, dynamic>;
  }

  static ProvinceModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(ProvinceModel.serializer, map);
  }

  static Serializer<ProvinceModel> get serializer => _$provinceModelSerializer;
}
