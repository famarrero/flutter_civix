// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EntitiesResponseModel> _$entitiesResponseModelSerializer =
    new _$EntitiesResponseModelSerializer();

class _$EntitiesResponseModelSerializer
    implements StructuredSerializer<EntitiesResponseModel> {
  @override
  final Iterable<Type> types = const [
    EntitiesResponseModel,
    _$EntitiesResponseModel
  ];
  @override
  final String wireName = 'EntitiesResponseModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EntitiesResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entities_list',
      serializers.serialize(object.entitiesList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(EntityModel)])),
    ];

    return result;
  }

  @override
  EntitiesResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntitiesResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entities_list':
          result.entitiesList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(EntityModel)]))!
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$EntitiesResponseModel extends EntitiesResponseModel {
  @override
  final BuiltList<EntityModel> entitiesList;

  factory _$EntitiesResponseModel(
          [void Function(EntitiesResponseModelBuilder)? updates]) =>
      (new EntitiesResponseModelBuilder()..update(updates)).build();

  _$EntitiesResponseModel._({required this.entitiesList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        entitiesList, 'EntitiesResponseModel', 'entitiesList');
  }

  @override
  EntitiesResponseModel rebuild(
          void Function(EntitiesResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntitiesResponseModelBuilder toBuilder() =>
      new EntitiesResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntitiesResponseModel && entitiesList == other.entitiesList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, entitiesList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntitiesResponseModel')
          ..add('entitiesList', entitiesList))
        .toString();
  }
}

class EntitiesResponseModelBuilder
    implements Builder<EntitiesResponseModel, EntitiesResponseModelBuilder> {
  _$EntitiesResponseModel? _$v;

  ListBuilder<EntityModel>? _entitiesList;
  ListBuilder<EntityModel> get entitiesList =>
      _$this._entitiesList ??= new ListBuilder<EntityModel>();
  set entitiesList(ListBuilder<EntityModel>? entitiesList) =>
      _$this._entitiesList = entitiesList;

  EntitiesResponseModelBuilder();

  EntitiesResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entitiesList = $v.entitiesList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntitiesResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EntitiesResponseModel;
  }

  @override
  void update(void Function(EntitiesResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EntitiesResponseModel build() {
    _$EntitiesResponseModel _$result;
    try {
      _$result = _$v ??
          new _$EntitiesResponseModel._(entitiesList: entitiesList.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entitiesList';
        entitiesList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntitiesResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
