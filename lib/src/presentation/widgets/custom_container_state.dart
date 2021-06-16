import 'package:flutter/material.dart';
import 'package:flutter_civix/src/presentation/app/constants/constants.dart';

class CustomContainerState extends StatelessWidget {
  final Color colorState;
  final String textState;
  const CustomContainerState({required this.colorState, required this.textState});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          color: colorState,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Constants.cornersRadius),
              topRight: Radius.circular(Constants.differentCornerRaduis))),
      child: Row(
        children: [
          SizedBox(width: 16),
          Text(textState,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Constants.nomalTextSize,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
