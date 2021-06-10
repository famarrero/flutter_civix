import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? colorIcon;
  final Widget body;
  final String buttonName;
  final Function? buttonAction;

  CustomDialogBox(
      {required this.title,
      this.icon,
      this.colorIcon,
      required this.body,
      required this.buttonName,
      this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 22),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 37),
              Expanded(
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
              Icon(icon,
                  color: (colorIcon != null) ? colorIcon : Colors.blue,
                  size: 40),
              SizedBox(width: 25)
            ],
          ),
          SizedBox(height: 22),
          body,
          SizedBox(height: 22),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () => (buttonAction != null)
                    ? buttonAction!()
                    : {Navigator.of(context).pop()},
                child: Text(
                  buttonName,
                  style: TextStyle(fontSize: 18),
                )),
          ),
          SizedBox(height: 16)
        ],
      ),
    );
  }
}

class CustomDialogInformation extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? colorIcon;
  final String message;
  final String buttonName;
  final Function? buttonAction;

  CustomDialogInformation(
      {required this.title,
      this.icon,
      this.colorIcon,
      required this.message,
      required this.buttonName,
      this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return CustomDialogBox(
      title: title,
      icon: icon,
      colorIcon: colorIcon,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(message, style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
      buttonName: buttonName,
      buttonAction: buttonAction,
    );
  }
}
