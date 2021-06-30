// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provinces_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProvincesResponseModel> _$provincesResponseModelSerializer =
    new _$ProvincesResponseModelSerializer();

class _$ProvincesResponseModelSerializer
    implements StructuredSerializer<ProvincesResponseModel> {
  @override
  final Iterable<Type> types = const [
    ProvincesResponseModel,
    _$ProvincesResponseModel
  ];
  @override
  final String wireName = 'ProvincesResponseModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ProvincesResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'provinces_list',
      serializers.serialize(object.provincesList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ProvinceModel)])),
    ];

    return result;
  }

  @override
  ProvincesResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProvincesResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'provinces_list':
          result.provincesList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProvinceModel)]))!
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ProvincesResponseModel extends ProvincesResponseModel {
  @override
  final BuiltList<ProvinceModel> provincesList;

  factory _$ProvincesResponseModel(
          [void Function(ProvincesResponseModelBuilder)? updates]) =>
      (new ProvincesResponseModelBuilder()..update(updates)).build();

  _$ProvincesResponseModel._({required this.provincesList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        provincesList, 'ProvincesResponseModel', 'provincesList');
  }

  @override
  ProvincesResponseModel rebuild(
          void Function(ProvincesResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvincesResponseModelBuilder toBuilder() =>
      new ProvincesResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvincesResponseModel &&
        provincesList == other.provincesList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, provincesList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProvincesResponseModel')
          ..add('provincesList', provincesList))
        .toString();
  }
}

class ProvincesResponseModelBuilder
    implements Builder<ProvincesResponseModel, ProvincesResponseModelBuilder> {
  _$ProvincesResponseModel? _$v;

  ListBuilder<ProvinceModel>? _provincesList;
  ListBuilder<ProvinceModel> get provincesList =>
      _$this._provincesList ??= new ListBuilder<ProvinceModel>();
  set provincesList(ListBuilder<ProvinceModel>? provincesList) =>
      _$this._provincesList = provincesList;

  ProvincesResponseModelBuilder();

  ProvincesResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _provincesList = $v.provincesList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProvincesResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvincesResponseModel;
  }

  @override
  void update(void Function(ProvincesResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProvincesResponseModel build() {
    _$ProvincesResponseModel _$result;
    try {
      _$result = _$v ??
          new _$ProvincesResponseModel._(provincesList: provincesList.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'provincesList';
        provincesList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProvincesResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
