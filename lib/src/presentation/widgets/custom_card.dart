import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/constants.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.child,
    this.backgroundColor,
    this.gradient,
    this.border,
    this.borderRadius,
    this.height,
    this.width,
    this.margin,
    this.elevetion,
    this.constraints,
  }) : super(key: key);
  final Widget? child;
  final Color? backgroundColor;
  final LinearGradient? gradient;
  final Border? border;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final double? elevetion;
  final BoxConstraints? constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.all(0),
      constraints: constraints,
      decoration: BoxDecoration(
          gradient: gradient,
          color: backgroundColor ?? Theme.of(context).cardColor,
          borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(20)),
          border: border,
          boxShadow: <BoxShadow>[
            if (Theme.of(context).brightness == Brightness.light)
              BoxShadow(
                blurRadius: 8,
                color: Theme.of(context).primaryColor.withAlpha(20),
              )
          ]),
      child: ClipRRect(
        borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(10)),
        child: Material(
          color: Colors.transparent,
          elevation: elevetion ?? 0.0,
          child: child,
        ),
      ),
    );
  }

  factory CustomCard.bordered({
    required final BuildContext context,
    required final Widget child,
    final EdgeInsetsGeometry? margin,
    final double? height,
    final double? width,
    final BorderRadius? borderRadius,
  }) {
    return CustomCard(
      margin: margin,
      height: height,
      width: width,
      borderRadius: borderRadius,
      backgroundColor: Theme.of(context).accentColor,
      border: Theme.of(context).brightness == Brightness.light
          ? Border.all(color: Theme.of(context).primaryColor.withAlpha(20))
          : null,
      child: child,
    );
  }
}

class CustomCardTopRightCorner extends StatelessWidget {
  final Widget child;

  const CustomCardTopRightCorner({required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Constants.cornersRadius),
          topRight: Radius.circular(Constants.differentCornerRaduis),
          bottomLeft: Radius.circular(Constants.cornersRadius),
          bottomRight: Radius.circular(Constants.cornersRadius)),
      child: child,
    );
  }
}
