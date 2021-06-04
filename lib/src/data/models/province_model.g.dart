// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProvinceModel> _$provinceModelSerializer =
    new _$ProvinceModelSerializer();

class _$ProvinceModelSerializer implements StructuredSerializer<ProvinceModel> {
  @override
  final Iterable<Type> types = const [ProvinceModel, _$ProvinceModel];
  @override
  final String wireName = 'ProvinceModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProvinceModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'province_name',
      serializers.serialize(object.provinceName,
          specifiedType: const FullType(String)),
      'province_abbreviation',
      serializers.serialize(object.provinceAbbreviation,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'municipalities_list',
      serializers.serialize(object.municipalitiesList,
          specifiedType: const FullType(
              BuiltList, const [const FullType(MunicipalityModel)])),
    ];

    return result;
  }

  @override
  ProvinceModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProvinceModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'province_name':
          result.provinceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'province_abbreviation':
          result.provinceAbbreviation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'municipalities_list':
          result.municipalitiesList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MunicipalityModel)]))!
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ProvinceModel extends ProvinceModel {
  @override
  final String provinceName;
  @override
  final String provinceAbbreviation;
  @override
  final String id;
  @override
  final BuiltList<MunicipalityModel> municipalitiesList;

  factory _$ProvinceModel([void Function(ProvinceModelBuilder)? updates]) =>
      (new ProvinceModelBuilder()..update(updates)).build();

  _$ProvinceModel._(
      {required this.provinceName,
      required this.provinceAbbreviation,
      required this.id,
      required this.municipalitiesList})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        provinceName, 'ProvinceModel', 'provinceName');
    BuiltValueNullFieldError.checkNotNull(
        provinceAbbreviation, 'ProvinceModel', 'provinceAbbreviation');
    BuiltValueNullFieldError.checkNotNull(id, 'ProvinceModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        municipalitiesList, 'ProvinceModel', 'municipalitiesList');
  }

  @override
  ProvinceModel rebuild(void Function(ProvinceModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvinceModelBuilder toBuilder() => new ProvinceModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvinceModel &&
        provinceName == other.provinceName &&
        provinceAbbreviation == other.provinceAbbreviation &&
        id == other.id &&
        municipalitiesList == other.municipalitiesList;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, provinceName.hashCode), provinceAbbreviation.hashCode),
            id.hashCode),
        municipalitiesList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProvinceModel')
          ..add('provinceName', provinceName)
          ..add('provinceAbbreviation', provinceAbbreviation)
          ..add('id', id)
          ..add('municipalitiesList', municipalitiesList))
        .toString();
  }
}

class ProvinceModelBuilder
    implements Builder<ProvinceModel, ProvinceModelBuilder> {
  _$ProvinceModel? _$v;

  String? _provinceName;
  String? get provinceName => _$this._provinceName;
  set provinceName(String? provinceName) => _$this._provinceName = provinceName;

  String? _provinceAbbreviation;
  String? get provinceAbbreviation => _$this._provinceAbbreviation;
  set provinceAbbreviation(String? provinceAbbreviation) =>
      _$this._provinceAbbreviation = provinceAbbreviation;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<MunicipalityModel>? _municipalitiesList;
  ListBuilder<MunicipalityModel> get municipalitiesList =>
      _$this._municipalitiesList ??= new ListBuilder<MunicipalityModel>();
  set municipalitiesList(ListBuilder<MunicipalityModel>? municipalitiesList) =>
      _$this._municipalitiesList = municipalitiesList;

  ProvinceModelBuilder();

  ProvinceModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _provinceName = $v.provinceName;
      _provinceAbbreviation = $v.provinceAbbreviation;
      _id = $v.id;
      _municipalitiesList = $v.municipalitiesList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProvinceModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvinceModel;
  }

  @override
  void update(void Function(ProvinceModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProvinceModel build() {
    _$ProvinceModel _$result;
    try {
      _$result = _$v ??
          new _$ProvinceModel._(
              provinceName: BuiltValueNullFieldError.checkNotNull(
                  provinceName, 'ProvinceModel', 'provinceName'),
              provinceAbbreviation: BuiltValueNullFieldError.checkNotNull(
                  provinceAbbreviation,
                  'ProvinceModel',
                  'provinceAbbreviation'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'ProvinceModel', 'id'),
              municipalitiesList: municipalitiesList.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'municipalitiesList';
        municipalitiesList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProvinceModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
