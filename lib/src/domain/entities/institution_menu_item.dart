import 'package:flutter/material.dart';

class InstitutionMenuItem {
  final IconData imagSrc;
  final String title;
  final Color color;
  final Function()? onTap;

  InstitutionMenuItem(
      {required this.imagSrc, required this.title, required this.color, this.onTap});
}
