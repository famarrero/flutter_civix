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
  final String provinceName;
  final ProvinceModel provinceModel;
  final String municipalityName;
  final MunicipalityModel municipalityModel;
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

  @override
  String toString() {
    return 'PromoterFRG{firstName: $firstName, firstLastName: $firstLastName, province: $provinceName, municipality: $municipalityName}';
  }
}
