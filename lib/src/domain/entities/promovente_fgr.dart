class PromoterFRG {
  final String? primerNombre;
  final String? segundoNombre;
  final String? primerApellido;
  final String? segundoApellido;
  final String? ci;
  final String? telefono;
  final String? email;
  final String provincia;
  final String municipio;
  final String? direccion;

  PromoterFRG(
      {this.primerNombre,
      this.segundoNombre,
      this.primerApellido,
      this.segundoApellido,
      this.ci,
      this.telefono,
      this.email,
      required this.provincia,
      required this.municipio,
      this.direccion});
}
