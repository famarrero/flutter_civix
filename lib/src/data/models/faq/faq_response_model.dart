import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_civix/src/data/models/faq/question_model.dart';

part 'faq_response_model.g.dart';

abstract class FaqResponseModel
    implements Built<FaqResponseModel, FaqResponseModelBuilder> {
  FaqResponseModel._();

  factory FaqResponseModel([void Function(FaqResponseModelBuilder) updates]) =
      _$FaqResponseModel;

  @BuiltValueField(wireName: 'questions_list')
  BuiltList<QuestionModel> get questionsList;

  String toJson() {
    return json.encode(serializers.serializeWith(FaqResponseModel.serializer, this));
  }

  static FaqResponseModel? fromJson(String jsonString) {
    return serializers.deserializeWith(FaqResponseModel.serializer, json.decode(jsonString));
  }

  static FaqResponseModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(FaqResponseModel.serializer, map);
  }

  static Serializer<FaqResponseModel> get serializer => _$faqResponseModelSerializer;
}
