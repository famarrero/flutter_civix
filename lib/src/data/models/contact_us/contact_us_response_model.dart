import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_civix/src/data/models/entity/coordinates_model.dart';

part 'contact_us_response_model.g.dart';

abstract class ContactUsResponseModel
    implements Built<ContactUsResponseModel, ContactUsResponseModelBuilder> {
  ContactUsResponseModel._();

  factory ContactUsResponseModel([void Function(ContactUsResponseModelBuilder) updates]) =
      _$ContactUsResponseModel;

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

  @BuiltValueField(wireName: 'links_list')
  BuiltList<String>? get linksList;

  @BuiltValueField(wireName: 'facebook')
  String? get facebook;

  @BuiltValueField(wireName: 'twitter')
  String? get twitter;

  @BuiltValueField(wireName: 'youtube')
  String? get youtube;

  @BuiltValueField(wireName: 'telegram')
  String? get telegram;

  String toJson() {
    return json.encode(serializers.serializeWith(ContactUsResponseModel.serializer, this));
  }

  static ContactUsResponseModel? fromJson(String jsonString) {
    return serializers.deserializeWith(ContactUsResponseModel.serializer, json.decode(jsonString));
  }

  static ContactUsResponseModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(ContactUsResponseModel.serializer, map);
  }

  static Serializer<ContactUsResponseModel> get serializer => _$contactUsResponseModelSerializer;
}
