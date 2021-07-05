import 'package:flutter/material.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).aboutUs),
      ),
      body: Center(child: Text(S.of(context).underConstruction.toUpperCase())),
    );
  }
}