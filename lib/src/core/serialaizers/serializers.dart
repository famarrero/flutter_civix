import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_civix/src/data/models/municipality_model.dart';
import 'package:flutter_civix/src/data/models/province_model.dart';
import 'package:flutter_civix/src/data/models/provinces_response_model.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor([ProvincesResponseModel, ProvinceModel, MunicipalityModel])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
    // ..addBuilderFactory(const FullType(BuiltList, [FullType(Todo)]), () => ListBuilder<Todo>())
    ).build();
