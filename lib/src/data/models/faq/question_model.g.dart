// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuestionModel> _$questionModelSerializer =
    new _$QuestionModelSerializer();

class _$QuestionModelSerializer implements StructuredSerializer<QuestionModel> {
  @override
  final Iterable<Type> types = const [QuestionModel, _$QuestionModel];
  @override
  final String wireName = 'QuestionModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, QuestionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'question',
      serializers.serialize(object.question,
          specifiedType: const FullType(String)),
      'responses_list',
      serializers.serialize(object.responsesList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ResponseModel)])),
    ];

    return result;
  }

  @override
  QuestionModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'responses_list':
          result.responsesList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ResponseModel)]))!
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$QuestionModel extends QuestionModel {
  @override
  final String question;
  @override
  final BuiltList<ResponseModel> responsesList;

  factory _$QuestionModel([void Function(QuestionModelBuilder)? updates]) =>
      (new QuestionModelBuilder()..update(updates)).build();

  _$QuestionModel._({required this.question, required this.responsesList})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        question, 'QuestionModel', 'question');
    BuiltValueNullFieldError.checkNotNull(
        responsesList, 'QuestionModel', 'responsesList');
  }

  @override
  QuestionModel rebuild(void Function(QuestionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionModelBuilder toBuilder() => new QuestionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionModel &&
        question == other.question &&
        responsesList == other.responsesList;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, question.hashCode), responsesList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('QuestionModel')
          ..add('question', question)
          ..add('responsesList', responsesList))
        .toString();
  }
}

class QuestionModelBuilder
    implements Builder<QuestionModel, QuestionModelBuilder> {
  _$QuestionModel? _$v;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  ListBuilder<ResponseModel>? _responsesList;
  ListBuilder<ResponseModel> get responsesList =>
      _$this._responsesList ??= new ListBuilder<ResponseModel>();
  set responsesList(ListBuilder<ResponseModel>? responsesList) =>
      _$this._responsesList = responsesList;

  QuestionModelBuilder();

  QuestionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _question = $v.question;
      _responsesList = $v.responsesList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuestionModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuestionModel;
  }

  @override
  void update(void Function(QuestionModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$QuestionModel build() {
    _$QuestionModel _$result;
    try {
      _$result = _$v ??
          new _$QuestionModel._(
              question: BuiltValueNullFieldError.checkNotNull(
                  question, 'QuestionModel', 'question'),
              responsesList: responsesList.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'responsesList';
        responsesList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'QuestionModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
