import 'dart:convert';

import 'package:flutter_civix/src/data/models/municipality_model.dart';
import 'package:flutter_civix/src/data/models/province_model.dart';

class PromoterFRG {
  final String? firstName;
  final String? secondName;
  final String? firstLastName;
  final String? secondLastName;
  final String? id;
  final String? phone;
  final String? email;
  final String? provinceName;
  final ProvinceModel? provinceModel;
  final String? municipalityName;
  final MunicipalityModel? municipalityModel;
  final String? address;

  PromoterFRG(
      {this.firstName,
      this.secondName,
      this.firstLastName,
      this.secondLastName,
      this.id,
      this.phone,
      this.email,
      required this.provinceName,
      required this.provinceModel,
      required this.municipalityName,
      required this.municipalityModel,
      this.address});

  String toJson() {
    return jsonEncode(this.toMap());
  }

  static PromoterFRG fromJson(String jsonString) {
    return PromoterFRG.fromMap(jsonDecode(jsonString));
  }

  factory PromoterFRG.fromMap(Map<String, dynamic> map) {
    var provinceModel = map['provinceModel'] as String?;
    var municipalityModel = map['municipalityModel'] as String?;

    return new PromoterFRG(
      firstName: map['firstName'] as String?,
      secondName: map['secondName'] as String?,
      firstLastName: map['firstLastName'] as String?,
      secondLastName: map['secondLastName'] as String?,
      id: map['id'] as String?,
      phone: map['phone'] as String?,
      email: map['email'] as String?,
      provinceName: map['provinceName'] as String?,
      provinceModel: ProvinceModel.fromJson(provinceModel!),
      municipalityName: map['municipalityName'] as String?,
      municipalityModel: MunicipalityModel.fromJson(municipalityModel!),
      address: map['address'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'firstName': this.firstName,
      'secondName': this.secondName,
      'firstLastName': this.firstLastName,
      'secondLastName': this.secondLastName,
      'id': this.id,
      'phone': this.phone,
      'email': this.email,
      'provinceName': this.provinceName,
      'provinceModel': this.provinceModel?.toJson(),
      'municipalityName': this.municipalityName,
      'municipalityModel': this.municipalityModel?.toJson(),
      'address': this.address,
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'PromoterFRG{firstName: $firstName, firstLastName: $firstLastName, province: $provinceName, municipality: $municipalityName}';
  }
}
