// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipality_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MunicipalityModel> _$municipalityModelSerializer =
    new _$MunicipalityModelSerializer();

class _$MunicipalityModelSerializer
    implements StructuredSerializer<MunicipalityModel> {
  @override
  final Iterable<Type> types = const [MunicipalityModel, _$MunicipalityModel];
  @override
  final String wireName = 'MunicipalityModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, MunicipalityModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'municipality_name',
      serializers.serialize(object.municipalityName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  MunicipalityModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MunicipalityModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'municipality_name':
          result.municipalityName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MunicipalityModel extends MunicipalityModel {
  @override
  final String id;
  @override
  final String municipalityName;

  factory _$MunicipalityModel(
          [void Function(MunicipalityModelBuilder)? updates]) =>
      (new MunicipalityModelBuilder()..update(updates)).build();

  _$MunicipalityModel._({required this.id, required this.municipalityName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'MunicipalityModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        municipalityName, 'MunicipalityModel', 'municipalityName');
  }

  @override
  MunicipalityModel rebuild(void Function(MunicipalityModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MunicipalityModelBuilder toBuilder() =>
      new MunicipalityModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MunicipalityModel &&
        id == other.id &&
        municipalityName == other.municipalityName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), municipalityName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MunicipalityModel')
          ..add('id', id)
          ..add('municipalityName', municipalityName))
        .toString();
  }
}

class MunicipalityModelBuilder
    implements Builder<MunicipalityModel, MunicipalityModelBuilder> {
  _$MunicipalityModel? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _municipalityName;
  String? get municipalityName => _$this._municipalityName;
  set municipalityName(String? municipalityName) =>
      _$this._municipalityName = municipalityName;

  MunicipalityModelBuilder();

  MunicipalityModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _municipalityName = $v.municipalityName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MunicipalityModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MunicipalityModel;
  }

  @override
  void update(void Function(MunicipalityModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MunicipalityModel build() {
    final _$result = _$v ??
        new _$MunicipalityModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'MunicipalityModel', 'id'),
            municipalityName: BuiltValueNullFieldError.checkNotNull(
                municipalityName, 'MunicipalityModel', 'municipalityName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
