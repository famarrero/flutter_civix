// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CoordinatesModel> _$coordinatesModelSerializer =
    new _$CoordinatesModelSerializer();

class _$CoordinatesModelSerializer
    implements StructuredSerializer<CoordinatesModel> {
  @override
  final Iterable<Type> types = const [CoordinatesModel, _$CoordinatesModel];
  @override
  final String wireName = 'CoordinatesModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CoordinatesModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'latitude',
      serializers.serialize(object.latitude,
          specifiedType: const FullType(String)),
      'longitude',
      serializers.serialize(object.longitude,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CoordinatesModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CoordinatesModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CoordinatesModel extends CoordinatesModel {
  @override
  final String latitude;
  @override
  final String longitude;

  factory _$CoordinatesModel(
          [void Function(CoordinatesModelBuilder)? updates]) =>
      (new CoordinatesModelBuilder()..update(updates)).build();

  _$CoordinatesModel._({required this.latitude, required this.longitude})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        latitude, 'CoordinatesModel', 'latitude');
    BuiltValueNullFieldError.checkNotNull(
        longitude, 'CoordinatesModel', 'longitude');
  }

  @override
  CoordinatesModel rebuild(void Function(CoordinatesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoordinatesModelBuilder toBuilder() =>
      new CoordinatesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CoordinatesModel &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, latitude.hashCode), longitude.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CoordinatesModel')
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class CoordinatesModelBuilder
    implements Builder<CoordinatesModel, CoordinatesModelBuilder> {
  _$CoordinatesModel? _$v;

  String? _latitude;
  String? get latitude => _$this._latitude;
  set latitude(String? latitude) => _$this._latitude = latitude;

  String? _longitude;
  String? get longitude => _$this._longitude;
  set longitude(String? longitude) => _$this._longitude = longitude;

  CoordinatesModelBuilder();

  CoordinatesModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CoordinatesModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CoordinatesModel;
  }

  @override
  void update(void Function(CoordinatesModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CoordinatesModel build() {
    final _$result = _$v ??
        new _$CoordinatesModel._(
            latitude: BuiltValueNullFieldError.checkNotNull(
                latitude, 'CoordinatesModel', 'latitude'),
            longitude: BuiltValueNullFieldError.checkNotNull(
                longitude, 'CoordinatesModel', 'longitude'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
