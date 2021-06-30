import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serializers/serializers.dart';

part 'texts_model.g.dart';

abstract class TextsModel implements Built<TextsModel, TextsModelBuilder> {
  TextsModel._();

  factory TextsModel([void Function(TextsModelBuilder) updates]) = _$TextsModel;

  @BuiltValueField(wireName: 'is_header')
  bool? get isHeader;

  @BuiltValueField(wireName: 'text')
  String get text;

  String toJson() {
    return json.encode(serializers.serializeWith(TextsModel.serializer, this));
  }

  static TextsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TextsModel.serializer, json.decode(jsonString));
  }

  static TextsModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(TextsModel.serializer, map);
  }

  static Serializer<TextsModel> get serializer => _$textsModelSerializer;
}
