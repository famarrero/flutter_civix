import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_civix/src/data/models/entity/entity_model.dart';

part 'entities_response_model.g.dart';

abstract class EntitiesResponseModel
    implements Built<EntitiesResponseModel, EntitiesResponseModelBuilder> {
  EntitiesResponseModel._();

  factory EntitiesResponseModel([void Function(EntitiesResponseModelBuilder) updates]) =
      _$EntitiesResponseModel;

  @BuiltValueField(wireName: 'entities_list')
  BuiltList<EntityModel> get entitiesList;

  String toJson() {
    return json.encode(serializers.serializeWith(EntitiesResponseModel.serializer, this));
  }

  static EntitiesResponseModel? fromJson(String jsonString) {
    return serializers.deserializeWith(EntitiesResponseModel.serializer, json.decode(jsonString));
  }

  static EntitiesResponseModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(EntitiesResponseModel.serializer, map);
  }

  static Serializer<EntitiesResponseModel> get serializer => _$entitiesResponseModelSerializer;
}
