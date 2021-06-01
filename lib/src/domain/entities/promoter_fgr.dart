class PromoterFRG {
  final String? firstName;
  final String? secondName;
  final String? firstLastName;
  final String? secondLastName;
  final String? id;
  final String? phone;
  final String? email;
  final String province;
  final String municipality;
  final String? address;

  PromoterFRG(
      {this.firstName,
      this.secondName,
      this.firstLastName,
      this.secondLastName,
      this.id,
      this.phone,
      this.email,
      required this.province,
      required this.municipality,
      this.address});

  @override
  String toString() {
    return 'PromoterFRG{firstName: $firstName, firstLastName: $firstLastName, province: $province, municipality: $municipality}';
  }
}
