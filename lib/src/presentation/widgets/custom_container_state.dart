import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/dimens.dart';

///This is the bar when shoeing the state and color of statement
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
              topLeft: Radius.circular(kCornersRadius),
              topRight: Radius.circular(kDifferentCornerRadius))),
      child: Row(
        children: [
          SizedBox(width: 16),
          Text(textState,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: kNormalTextSize,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
