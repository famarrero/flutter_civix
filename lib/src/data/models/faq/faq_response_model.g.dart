// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FaqResponseModel> _$faqResponseModelSerializer =
    new _$FaqResponseModelSerializer();

class _$FaqResponseModelSerializer
    implements StructuredSerializer<FaqResponseModel> {
  @override
  final Iterable<Type> types = const [FaqResponseModel, _$FaqResponseModel];
  @override
  final String wireName = 'FaqResponseModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, FaqResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'questions_list',
      serializers.serialize(object.questionsList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(QuestionModel)])),
    ];

    return result;
  }

  @override
  FaqResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FaqResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'questions_list':
          result.questionsList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(QuestionModel)]))!
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$FaqResponseModel extends FaqResponseModel {
  @override
  final BuiltList<QuestionModel> questionsList;

  factory _$FaqResponseModel(
          [void Function(FaqResponseModelBuilder)? updates]) =>
      (new FaqResponseModelBuilder()..update(updates)).build();

  _$FaqResponseModel._({required this.questionsList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        questionsList, 'FaqResponseModel', 'questionsList');
  }

  @override
  FaqResponseModel rebuild(void Function(FaqResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FaqResponseModelBuilder toBuilder() =>
      new FaqResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FaqResponseModel && questionsList == other.questionsList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, questionsList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FaqResponseModel')
          ..add('questionsList', questionsList))
        .toString();
  }
}

class FaqResponseModelBuilder
    implements Builder<FaqResponseModel, FaqResponseModelBuilder> {
  _$FaqResponseModel? _$v;

  ListBuilder<QuestionModel>? _questionsList;
  ListBuilder<QuestionModel> get questionsList =>
      _$this._questionsList ??= new ListBuilder<QuestionModel>();
  set questionsList(ListBuilder<QuestionModel>? questionsList) =>
      _$this._questionsList = questionsList;

  FaqResponseModelBuilder();

  FaqResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _questionsList = $v.questionsList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FaqResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FaqResponseModel;
  }

  @override
  void update(void Function(FaqResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FaqResponseModel build() {
    _$FaqResponseModel _$result;
    try {
      _$result =
          _$v ?? new _$FaqResponseModel._(questionsList: questionsList.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'questionsList';
        questionsList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FaqResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
