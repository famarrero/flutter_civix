import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serializers/serializers.dart';

part 'coordinates_model.g.dart';

abstract class CoordinatesModel
    implements Built<CoordinatesModel, CoordinatesModelBuilder> {
  CoordinatesModel._();

  factory CoordinatesModel([void Function(CoordinatesModelBuilder) updates]) =
  _$CoordinatesModel;

  @BuiltValueField(wireName: 'latitude')
  String get latitude;

  @BuiltValueField(wireName: 'longitude')
  String get longitude;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CoordinatesModel.serializer, this));
  }

  static CoordinatesModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CoordinatesModel.serializer, json.decode(jsonString));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(CoordinatesModel.serializer, this) as Map<String, dynamic>;
  }

  static CoordinatesModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(CoordinatesModel.serializer, map);
  }

  static Serializer<CoordinatesModel> get serializer => _$coordinatesModelSerializer;
}
