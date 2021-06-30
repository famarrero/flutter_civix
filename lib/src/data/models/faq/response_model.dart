import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serializers/serializers.dart';

part 'response_model.g.dart';

abstract class ResponseModel
    implements Built<ResponseModel, ResponseModelBuilder> {
  ResponseModel._();

  factory ResponseModel([void Function(ResponseModelBuilder) updates]) =
      _$ResponseModel;

  @BuiltValueField(wireName: 'text')
  String get text;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ResponseModel.serializer, this));
  }

  static ResponseModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ResponseModel.serializer, json.decode(jsonString));
  }

  static ResponseModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(ResponseModel.serializer, map);
  }

  static Serializer<ResponseModel> get serializer => _$responseModelSerializer;
}
