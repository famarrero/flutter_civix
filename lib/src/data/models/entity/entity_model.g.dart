// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EntityModel> _$entityModelSerializer = new _$EntityModelSerializer();

class _$EntityModelSerializer implements StructuredSerializer<EntityModel> {
  @override
  final Iterable<Type> types = const [EntityModel, _$EntityModel];
  @override
  final String wireName = 'EntityModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, EntityModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.entity;
    if (value != null) {
      result
        ..add('entity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.boss;
    if (value != null) {
      result
        ..add('boss')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.province;
    if (value != null) {
      result
        ..add('province')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.municipality;
    if (value != null) {
      result
        ..add('municipality')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coordinates;
    if (value != null) {
      result
        ..add('coordinates')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CoordinatesModel)));
    }
    value = object.postalCode;
    if (value != null) {
      result
        ..add('postal_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailsList;
    if (value != null) {
      result
        ..add('emails_list')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.phonesList;
    if (value != null) {
      result
        ..add('phones_list')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  EntityModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntityModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entity':
          result.entity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'boss':
          result.boss = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'province':
          result.province = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'municipality':
          result.municipality = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'coordinates':
          result.coordinates.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CoordinatesModel))!
              as CoordinatesModel);
          break;
        case 'postal_code':
          result.postalCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'emails_list':
          result.emailsList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object>);
          break;
        case 'phones_list':
          result.phonesList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$EntityModel extends EntityModel {
  @override
  final String? entity;
  @override
  final String? boss;
  @override
  final String? province;
  @override
  final String? municipality;
  @override
  final String? address;
  @override
  final CoordinatesModel? coordinates;
  @override
  final String? postalCode;
  @override
  final BuiltList<String>? emailsList;
  @override
  final BuiltList<String>? phonesList;

  factory _$EntityModel([void Function(EntityModelBuilder)? updates]) =>
      (new EntityModelBuilder()..update(updates)).build();

  _$EntityModel._(
      {this.entity,
      this.boss,
      this.province,
      this.municipality,
      this.address,
      this.coordinates,
      this.postalCode,
      this.emailsList,
      this.phonesList})
      : super._();

  @override
  EntityModel rebuild(void Function(EntityModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntityModelBuilder toBuilder() => new EntityModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntityModel &&
        entity == other.entity &&
        boss == other.boss &&
        province == other.province &&
        municipality == other.municipality &&
        address == other.address &&
        coordinates == other.coordinates &&
        postalCode == other.postalCode &&
        emailsList == other.emailsList &&
        phonesList == other.phonesList;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, entity.hashCode), boss.hashCode),
                                province.hashCode),
                            municipality.hashCode),
                        address.hashCode),
                    coordinates.hashCode),
                postalCode.hashCode),
            emailsList.hashCode),
        phonesList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntityModel')
          ..add('entity', entity)
          ..add('boss', boss)
          ..add('province', province)
          ..add('municipality', municipality)
          ..add('address', address)
          ..add('coordinates', coordinates)
          ..add('postalCode', postalCode)
          ..add('emailsList', emailsList)
          ..add('phonesList', phonesList))
        .toString();
  }
}

class EntityModelBuilder implements Builder<EntityModel, EntityModelBuilder> {
  _$EntityModel? _$v;

  String? _entity;
  String? get entity => _$this._entity;
  set entity(String? entity) => _$this._entity = entity;

  String? _boss;
  String? get boss => _$this._boss;
  set boss(String? boss) => _$this._boss = boss;

  String? _province;
  String? get province => _$this._province;
  set province(String? province) => _$this._province = province;

  String? _municipality;
  String? get municipality => _$this._municipality;
  set municipality(String? municipality) => _$this._municipality = municipality;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  CoordinatesModelBuilder? _coordinates;
  CoordinatesModelBuilder get coordinates =>
      _$this._coordinates ??= new CoordinatesModelBuilder();
  set coordinates(CoordinatesModelBuilder? coordinates) =>
      _$this._coordinates = coordinates;

  String? _postalCode;
  String? get postalCode => _$this._postalCode;
  set postalCode(String? postalCode) => _$this._postalCode = postalCode;

  ListBuilder<String>? _emailsList;
  ListBuilder<String> get emailsList =>
      _$this._emailsList ??= new ListBuilder<String>();
  set emailsList(ListBuilder<String>? emailsList) =>
      _$this._emailsList = emailsList;

  ListBuilder<String>? _phonesList;
  ListBuilder<String> get phonesList =>
      _$this._phonesList ??= new ListBuilder<String>();
  set phonesList(ListBuilder<String>? phonesList) =>
      _$this._phonesList = phonesList;

  EntityModelBuilder();

  EntityModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entity = $v.entity;
      _boss = $v.boss;
      _province = $v.province;
      _municipality = $v.municipality;
      _address = $v.address;
      _coordinates = $v.coordinates?.toBuilder();
      _postalCode = $v.postalCode;
      _emailsList = $v.emailsList?.toBuilder();
      _phonesList = $v.phonesList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntityModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EntityModel;
  }

  @override
  void update(void Function(EntityModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EntityModel build() {
    _$EntityModel _$result;
    try {
      _$result = _$v ??
          new _$EntityModel._(
              entity: entity,
              boss: boss,
              province: province,
              municipality: municipality,
              address: address,
              coordinates: _coordinates?.build(),
              postalCode: postalCode,
              emailsList: _emailsList?.build(),
              phonesList: _phonesList?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'coordinates';
        _coordinates?.build();

        _$failedField = 'emailsList';
        _emailsList?.build();
        _$failedField = 'phonesList';
        _phonesList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntityModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
