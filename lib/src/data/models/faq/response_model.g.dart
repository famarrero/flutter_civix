// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResponseModel> _$responseModelSerializer =
    new _$ResponseModelSerializer();

class _$ResponseModelSerializer implements StructuredSerializer<ResponseModel> {
  @override
  final Iterable<Type> types = const [ResponseModel, _$ResponseModel];
  @override
  final String wireName = 'ResponseModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseModel extends ResponseModel {
  @override
  final String text;

  factory _$ResponseModel([void Function(ResponseModelBuilder)? updates]) =>
      (new ResponseModelBuilder()..update(updates)).build();

  _$ResponseModel._({required this.text}) : super._() {
    BuiltValueNullFieldError.checkNotNull(text, 'ResponseModel', 'text');
  }

  @override
  ResponseModel rebuild(void Function(ResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseModelBuilder toBuilder() => new ResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseModel && text == other.text;
  }

  @override
  int get hashCode {
    return $jf($jc(0, text.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResponseModel')..add('text', text))
        .toString();
  }
}

class ResponseModelBuilder
    implements Builder<ResponseModel, ResponseModelBuilder> {
  _$ResponseModel? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ResponseModelBuilder();

  ResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponseModel;
  }

  @override
  void update(void Function(ResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResponseModel build() {
    final _$result = _$v ??
        new _$ResponseModel._(
            text: BuiltValueNullFieldError.checkNotNull(
                text, 'ResponseModel', 'text'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
