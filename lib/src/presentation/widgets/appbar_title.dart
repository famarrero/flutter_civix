import 'package:flutter/material.dart';

class AppBarTitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;

  AppBarTitleSubtitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 4),
        Text(subtitle,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
      ],
    );
  }
}
