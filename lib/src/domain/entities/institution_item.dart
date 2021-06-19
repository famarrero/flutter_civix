import 'package:flutter/material.dart';

class InstitutionItem {
  final String imagSrc;
  final String title;
  final Color color;
  final Function()? onTap;

  InstitutionItem(
      {required this.imagSrc, required this.title, required this.color, this.onTap});
}
