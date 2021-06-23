import 'package:flutter/material.dart';

class SideBarTextSeparator extends StatelessWidget {
  final String text;

  const SideBarTextSeparator({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 12),
      ),
    );
  }
}
