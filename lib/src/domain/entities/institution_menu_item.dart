import 'package:flutter/material.dart';

class InstitutionMenuItem {
  final IconData imageSrc;
  final String title;
  final Color color;
  final Function()? onTap;

  InstitutionMenuItem(
      {required this.imageSrc, required this.title, required this.color, this.onTap});
}
