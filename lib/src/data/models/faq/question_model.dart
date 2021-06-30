import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_civix/src/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_civix/src/data/models/faq/response_model.dart';

part 'question_model.g.dart';

abstract class QuestionModel
    implements Built<QuestionModel, QuestionModelBuilder> {
  QuestionModel._();

  factory QuestionModel([void Function(QuestionModelBuilder) updates]) =
      _$QuestionModel;

  @BuiltValueField(wireName: 'question')
  String get question;

  @BuiltValueField(wireName: 'responses_list')
  BuiltList<ResponseModel> get responsesList;

  String toJson() {
    return json.encode(serializers.serializeWith(QuestionModel.serializer, this));
  }

  static QuestionModel? fromJson(String jsonString) {
    return serializers.deserializeWith(QuestionModel.serializer, json.decode(jsonString));
  }

  static QuestionModel? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(QuestionModel.serializer, map);
  }

  static Serializer<QuestionModel> get serializer => _$questionModelSerializer;
}
