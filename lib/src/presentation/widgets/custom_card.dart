import 'package:flutter/material.dart';
import 'package:flutter_civix/src/presentation/app/constants/constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Constants.cornersRadius)),
      child: child,
    );
  }
}

class CustomCardTopRightCorner extends StatelessWidget {
  final Widget child;

  const CustomCardTopRightCorner({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Constants.cornersRadius),
              topRight: Radius.circular(Constants.differentCornerRaduis),
              bottomLeft: Radius.circular(Constants.cornersRadius),
              bottomRight: Radius.circular(Constants.cornersRadius))),
      child: child,
    );
  }
}
