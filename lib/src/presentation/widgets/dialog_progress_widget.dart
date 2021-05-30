import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogProgressWidget extends StatelessWidget {
  final String message;

  DialogProgressWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
          content: Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
            SizedBox(width: 8),
            Expanded(child: Text(message))
          ],
        ),
      )),
    );
  }
}
