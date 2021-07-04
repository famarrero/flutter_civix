// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContactUsResponseModel> _$contactUsResponseModelSerializer =
    new _$ContactUsResponseModelSerializer();

class _$ContactUsResponseModelSerializer
    implements StructuredSerializer<ContactUsResponseModel> {
  @override
  final Iterable<Type> types = const [
    ContactUsResponseModel,
    _$ContactUsResponseModel
  ];
  @override
  final String wireName = 'ContactUsResponseModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ContactUsResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.linksList;
    if (value != null) {
      result
        ..add('links_list')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.facebook;
    if (value != null) {
      result
        ..add('facebook')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.twitter;
    if (value != null) {
      result
        ..add('twitter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.youtube;
    if (value != null) {
      result
        ..add('youtube')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.telegram;
    if (value != null) {
      result
        ..add('telegram')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ContactUsResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactUsResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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
        case 'links_list':
          result.linksList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object>);
          break;
        case 'facebook':
          result.facebook = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'twitter':
          result.twitter = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'youtube':
          result.youtube = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'telegram':
          result.telegram = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ContactUsResponseModel extends ContactUsResponseModel {
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
  @override
  final BuiltList<String>? linksList;
  @override
  final String? facebook;
  @override
  final String? twitter;
  @override
  final String? youtube;
  @override
  final String? telegram;

  factory _$ContactUsResponseModel(
          [void Function(ContactUsResponseModelBuilder)? updates]) =>
      (new ContactUsResponseModelBuilder()..update(updates)).build();

  _$ContactUsResponseModel._(
      {this.province,
      this.municipality,
      this.address,
      this.coordinates,
      this.postalCode,
      this.emailsList,
      this.phonesList,
      this.linksList,
      this.facebook,
      this.twitter,
      this.youtube,
      this.telegram})
      : super._();

  @override
  ContactUsResponseModel rebuild(
          void Function(ContactUsResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactUsResponseModelBuilder toBuilder() =>
      new ContactUsResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactUsResponseModel &&
        province == other.province &&
        municipality == other.municipality &&
        address == other.address &&
        coordinates == other.coordinates &&
        postalCode == other.postalCode &&
        emailsList == other.emailsList &&
        phonesList == other.phonesList &&
        linksList == other.linksList &&
        facebook == other.facebook &&
        twitter == other.twitter &&
        youtube == other.youtube &&
        telegram == other.telegram;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, province.hashCode),
                                                municipality.hashCode),
                                            address.hashCode),
                                        coordinates.hashCode),
                                    postalCode.hashCode),
                                emailsList.hashCode),
                            phonesList.hashCode),
                        linksList.hashCode),
                    facebook.hashCode),
                twitter.hashCode),
            youtube.hashCode),
        telegram.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactUsResponseModel')
          ..add('province', province)
          ..add('municipality', municipality)
          ..add('address', address)
          ..add('coordinates', coordinates)
          ..add('postalCode', postalCode)
          ..add('emailsList', emailsList)
          ..add('phonesList', phonesList)
          ..add('linksList', linksList)
          ..add('facebook', facebook)
          ..add('twitter', twitter)
          ..add('youtube', youtube)
          ..add('telegram', telegram))
        .toString();
  }
}

class ContactUsResponseModelBuilder
    implements Builder<ContactUsResponseModel, ContactUsResponseModelBuilder> {
  _$ContactUsResponseModel? _$v;

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

  ListBuilder<String>? _linksList;
  ListBuilder<String> get linksList =>
      _$this._linksList ??= new ListBuilder<String>();
  set linksList(ListBuilder<String>? linksList) =>
      _$this._linksList = linksList;

  String? _facebook;
  String? get facebook => _$this._facebook;
  set facebook(String? facebook) => _$this._facebook = facebook;

  String? _twitter;
  String? get twitter => _$this._twitter;
  set twitter(String? twitter) => _$this._twitter = twitter;

  String? _youtube;
  String? get youtube => _$this._youtube;
  set youtube(String? youtube) => _$this._youtube = youtube;

  String? _telegram;
  String? get telegram => _$this._telegram;
  set telegram(String? telegram) => _$this._telegram = telegram;

  ContactUsResponseModelBuilder();

  ContactUsResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _province = $v.province;
      _municipality = $v.municipality;
      _address = $v.address;
      _coordinates = $v.coordinates?.toBuilder();
      _postalCode = $v.postalCode;
      _emailsList = $v.emailsList?.toBuilder();
      _phonesList = $v.phonesList?.toBuilder();
      _linksList = $v.linksList?.toBuilder();
      _facebook = $v.facebook;
      _twitter = $v.twitter;
      _youtube = $v.youtube;
      _telegram = $v.telegram;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactUsResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactUsResponseModel;
  }

  @override
  void update(void Function(ContactUsResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactUsResponseModel build() {
    _$ContactUsResponseModel _$result;
    try {
      _$result = _$v ??
          new _$ContactUsResponseModel._(
              province: province,
              municipality: municipality,
              address: address,
              coordinates: _coordinates?.build(),
              postalCode: postalCode,
              emailsList: _emailsList?.build(),
              phonesList: _phonesList?.build(),
              linksList: _linksList?.build(),
              facebook: facebook,
              twitter: twitter,
              youtube: youtube,
              telegram: telegram);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'coordinates';
        _coordinates?.build();

        _$failedField = 'emailsList';
        _emailsList?.build();
        _$failedField = 'phonesList';
        _phonesList?.build();
        _$failedField = 'linksList';
        _linksList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ContactUsResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
