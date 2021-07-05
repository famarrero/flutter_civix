import 'package:flutter/material.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';

class QuickAccessPage extends StatelessWidget {
  const QuickAccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(S.of(context).underConstruction.toUpperCase())),
    );
  }
}
