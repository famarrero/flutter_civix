import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_civix/src/data/models/general/province_model.dart';

part 'provinces_response_model.g.dart';

abstract class ProvincesResponseModel
    implements Built<ProvincesResponseModel, ProvincesResponseModelBuilder> {
  ProvincesResponseModel._();

  factory ProvincesResponseModel([void Function(ProvincesResponseModelBuilder) updates]) =
      _$ProvincesResponseModel;

  @BuiltValueField(wireName: 'provinces_list')
  BuiltList<ProvinceModel> get provincesList;

  String toJson() {
    return json.encode(serializers.serializeWith(ProvincesResponseModel.serializer, this));
  }

  static ProvincesResponseModel? fromJson(String jsonString) {
    return serializers.deserializeWith(ProvincesResponseModel.serializer, json.decode(jsonString));
  }

  static ProvincesResponseModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(ProvincesResponseModel.serializer, map);
  }

  static Serializer<ProvincesResponseModel> get serializer => _$provincesResponseModelSerializer;
}
