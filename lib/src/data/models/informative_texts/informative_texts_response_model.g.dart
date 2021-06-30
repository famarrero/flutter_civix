// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'informative_texts_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InformativeTextsResponseModel>
    _$informativeTextsResponseModelSerializer =
    new _$InformativeTextsResponseModelSerializer();

class _$InformativeTextsResponseModelSerializer
    implements StructuredSerializer<InformativeTextsResponseModel> {
  @override
  final Iterable<Type> types = const [
    InformativeTextsResponseModel,
    _$InformativeTextsResponseModel
  ];
  @override
  final String wireName = 'InformativeTextsResponseModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, InformativeTextsResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'texts_list',
      serializers.serialize(object.textsList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TextsModel)])),
    ];

    return result;
  }

  @override
  InformativeTextsResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InformativeTextsResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'texts_list':
          result.textsList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TextsModel)]))!
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$InformativeTextsResponseModel extends InformativeTextsResponseModel {
  @override
  final String title;
  @override
  final BuiltList<TextsModel> textsList;

  factory _$InformativeTextsResponseModel(
          [void Function(InformativeTextsResponseModelBuilder)? updates]) =>
      (new InformativeTextsResponseModelBuilder()..update(updates)).build();

  _$InformativeTextsResponseModel._(
      {required this.title, required this.textsList})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        title, 'InformativeTextsResponseModel', 'title');
    BuiltValueNullFieldError.checkNotNull(
        textsList, 'InformativeTextsResponseModel', 'textsList');
  }

  @override
  InformativeTextsResponseModel rebuild(
          void Function(InformativeTextsResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InformativeTextsResponseModelBuilder toBuilder() =>
      new InformativeTextsResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InformativeTextsResponseModel &&
        title == other.title &&
        textsList == other.textsList;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, title.hashCode), textsList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InformativeTextsResponseModel')
          ..add('title', title)
          ..add('textsList', textsList))
        .toString();
  }
}

class InformativeTextsResponseModelBuilder
    implements
        Builder<InformativeTextsResponseModel,
            InformativeTextsResponseModelBuilder> {
  _$InformativeTextsResponseModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<TextsModel>? _textsList;
  ListBuilder<TextsModel> get textsList =>
      _$this._textsList ??= new ListBuilder<TextsModel>();
  set textsList(ListBuilder<TextsModel>? textsList) =>
      _$this._textsList = textsList;

  InformativeTextsResponseModelBuilder();

  InformativeTextsResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _textsList = $v.textsList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InformativeTextsResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InformativeTextsResponseModel;
  }

  @override
  void update(void Function(InformativeTextsResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InformativeTextsResponseModel build() {
    _$InformativeTextsResponseModel _$result;
    try {
      _$result = _$v ??
          new _$InformativeTextsResponseModel._(
              title: BuiltValueNullFieldError.checkNotNull(
                  title, 'InformativeTextsResponseModel', 'title'),
              textsList: textsList.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'textsList';
        textsList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InformativeTextsResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
