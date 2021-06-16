import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;

  CustomElevatedButton({required this.buttonText, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ))),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
