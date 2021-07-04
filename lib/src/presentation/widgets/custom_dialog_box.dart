import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/constants.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_elevated_button.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? colorIcon;
  final double? sizeIcon;
  final Widget body;
  final String buttonPositiveName;
  final Function()? buttonPositiveAction;
  final String? buttonNegativeName;
  final Function()? buttonNegativeAction;

  CustomDialogBox(
      {required this.title,
      this.icon,
      this.colorIcon,
      this.sizeIcon = Constants.normalIconSize,
      required this.body,
      required this.buttonPositiveName,
      this.buttonPositiveAction,
      this.buttonNegativeName,
      this.buttonNegativeAction});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // insetPadding: EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: _contentBox(context),
    );
  }

  _contentBox(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 37),
              Expanded(
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Icon(icon,
                  color: (colorIcon != null) ? colorIcon : Colors.blue,
                  size: (sizeIcon != null) ? sizeIcon : 45),
              SizedBox(width: 25)
            ],
          ),
          SizedBox(height: 26),
          body,
          SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: (buttonNegativeName != null),
                child: CustomElevatedButton(
                  color: colorIcon,
                  onPressed: (buttonNegativeAction != null)
                      ? buttonNegativeAction!
                      : () => Navigator.of(context).pop(),
                  buttonText:
                      (buttonNegativeName != null) ? buttonNegativeName! : '',
                ),
              ),
              SizedBox(width: 20),
              CustomElevatedButton(
                color: colorIcon,
                onPressed: (buttonPositiveAction != null)
                    ? buttonPositiveAction!
                    : () => Navigator.of(context).pop(),
                buttonText: buttonPositiveName,
              ),
            ],
          ),
          SizedBox(height: 24)
        ],
      ),
    );
  }
}

class CustomDialogs {
  customDialogInformation(
      {required BuildContext context,
      bool? isDismissible,
      required String title,
      IconData? icon,
      Color? colorIcon,
      double? sizeIcon,
      required String message,
      required String buttonPositiveName,
      Function()? buttonPositiveAction,
      String? buttonNegativeName,
      Function()? buttonNegativeAction}) {
    return showDialog<void>(
        context: context,
        barrierDismissible: (isDismissible != null) ? isDismissible : true,
        builder: (BuildContext dialogContext) => CustomDialogBox(
              title: title,
              icon: icon,
              colorIcon: colorIcon,
              sizeIcon: sizeIcon,
              body: Row(
                children: [
                  Expanded(
                      child: Text(message, style: TextStyle(fontSize: 16))),
                ],
              ),
              buttonPositiveName: buttonPositiveName,
              buttonPositiveAction: buttonPositiveAction,
              buttonNegativeName: buttonNegativeName,
              buttonNegativeAction: buttonNegativeAction,
            ));
  }

  customDialogBox(
      {required BuildContext context,
      bool? isDismissible,
      required String title,
      IconData? icon,
      Color? colorIcon,
      double? sizeIcon,
      required Widget body,
      required String buttonPositiveName,
      Function()? buttonPositiveAction,
      String? buttonNegativeName,
      Function()? buttonNegativeAction}) {
    return showDialog<void>(
        context: context,
        barrierDismissible: (isDismissible != null) ? isDismissible : true,
        builder: (BuildContext dialogContext) => CustomDialogBox(
              title: title,
              icon: icon,
              colorIcon: colorIcon,
              sizeIcon: sizeIcon,
              body: body,
              buttonPositiveName: buttonPositiveName,
              buttonPositiveAction: buttonPositiveAction,
              buttonNegativeName: buttonNegativeName,
              buttonNegativeAction: buttonNegativeAction,
            ));
  }

  customDialogInformationWithCheckBox({
    required BuildContext context,
    bool? isDismissible,
    required String title,
    IconData? icon,
    Color? colorIcon,
    double? sizeIcon,
    required String message,
    required String messageCheck,
    required String buttonPositiveName,
    Function()? buttonPositiveAction,
    String? buttonNegativeName,
    Function()? buttonNegativeAction,
    required bool checkboxValue,
    required void Function(bool?) checkboxFunction,
  }) {
    return showDialog<void>(
        context: context,
        barrierDismissible: (isDismissible != null) ? isDismissible : true,
        builder: (BuildContext dialogContext) {
          return StatefulBuilder(builder: (context, setState) {
            return CustomDialogBox(
              title: title,
              icon: icon,
              colorIcon: colorIcon,
              sizeIcon: sizeIcon,
              body: Column(
                children: [
                  Text(message, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 12),
                  CheckboxListTile(
                    title: Text(messageCheck, style: TextStyle(fontSize: 16)),
                    value: checkboxValue,
                    onChanged: (value) {
                      setState(() {
                        checkboxValue = value!;
                        checkboxFunction(value);
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                  )
                ],
              ),
              buttonPositiveName: buttonPositiveName,
              buttonPositiveAction: buttonPositiveAction,
              buttonNegativeName: buttonNegativeName,
              buttonNegativeAction: buttonNegativeAction,
            );
          });
        });
  }
}
