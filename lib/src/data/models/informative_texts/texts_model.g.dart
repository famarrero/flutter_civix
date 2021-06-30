// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'texts_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TextsModel> _$textsModelSerializer = new _$TextsModelSerializer();

class _$TextsModelSerializer implements StructuredSerializer<TextsModel> {
  @override
  final Iterable<Type> types = const [TextsModel, _$TextsModel];
  @override
  final String wireName = 'TextsModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, TextsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.isHeader;
    if (value != null) {
      result
        ..add('is_header')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  TextsModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TextsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'is_header':
          result.isHeader = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TextsModel extends TextsModel {
  @override
  final bool? isHeader;
  @override
  final String text;

  factory _$TextsModel([void Function(TextsModelBuilder)? updates]) =>
      (new TextsModelBuilder()..update(updates)).build();

  _$TextsModel._({this.isHeader, required this.text}) : super._() {
    BuiltValueNullFieldError.checkNotNull(text, 'TextsModel', 'text');
  }

  @override
  TextsModel rebuild(void Function(TextsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextsModelBuilder toBuilder() => new TextsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextsModel &&
        isHeader == other.isHeader &&
        text == other.text;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isHeader.hashCode), text.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TextsModel')
          ..add('isHeader', isHeader)
          ..add('text', text))
        .toString();
  }
}

class TextsModelBuilder implements Builder<TextsModel, TextsModelBuilder> {
  _$TextsModel? _$v;

  bool? _isHeader;
  bool? get isHeader => _$this._isHeader;
  set isHeader(bool? isHeader) => _$this._isHeader = isHeader;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  TextsModelBuilder();

  TextsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isHeader = $v.isHeader;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TextsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextsModel;
  }

  @override
  void update(void Function(TextsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TextsModel build() {
    final _$result = _$v ??
        new _$TextsModel._(
            isHeader: isHeader,
            text: BuiltValueNullFieldError.checkNotNull(
                text, 'TextsModel', 'text'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
