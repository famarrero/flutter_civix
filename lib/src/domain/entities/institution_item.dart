import 'package:flutter/material.dart';

class InstitutionItem {
  final String imageSrc;
  final String title;
  final Color color;
  final Function()? onTap;

  InstitutionItem(
      {required this.imageSrc, required this.title, required this.color, this.onTap});
}
