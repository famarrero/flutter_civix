import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_civix/src/data/models/entity/coordinates_model.dart';

part 'entity_model.g.dart';

abstract class EntityModel implements Built<EntityModel, EntityModelBuilder> {
  EntityModel._();

  factory EntityModel([void Function(EntityModelBuilder) updates]) =
      _$EntityModel;

  @BuiltValueField(wireName: 'entity')
  String? get entity;

  @BuiltValueField(wireName: 'boss')
  String? get boss;

  @BuiltValueField(wireName: 'province')
  String? get province;

  @BuiltValueField(wireName: 'municipality')
  String? get municipality;

  @BuiltValueField(wireName: 'address')
  String? get address;

  @BuiltValueField(wireName: 'coordinates')
  CoordinatesModel? get coordinates;

  @BuiltValueField(wireName: 'postal_code')
  String? get postalCode;

  @BuiltValueField(wireName: 'emails_list')
  BuiltList<String>? get emailsList;

  @BuiltValueField(wireName: 'phones_list')
  BuiltList<String>? get phonesList;

  String toJson() {
    return json.encode(serializers.serializeWith(EntityModel.serializer, this));
  }

  static EntityModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        EntityModel.serializer, json.decode(jsonString));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(EntityModel.serializer, this)
        as Map<String, dynamic>;
  }

  static EntityModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(EntityModel.serializer, map);
  }

  static Serializer<EntityModel> get serializer => _$entityModelSerializer;
}
