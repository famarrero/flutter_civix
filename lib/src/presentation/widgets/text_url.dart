import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/dimens.dart';
import 'package:flutter_civix/src/core/services_manager/url_launcher_manager.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_dialog_box.dart';

class TextUrl extends StatelessWidget {
  final String url;
  final Color colorAccent;

  TextUrl({required this.url, required this.colorAccent});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          CustomDialogs().customDialogInformation(
            context: context,
            title: S.of(context).info,
            message: S.of(context).doYouWantOpenThisLink,
            icon: Icons.link,
            colorIcon: colorAccent,
            sizeIcon: 35,
            buttonPositiveName: S.of(context).yes,
            buttonPositiveAction: () {
              injector<UrlLauncherManager>()..openUrl(url);
              Navigator.of(context).pop();
            },
            buttonNegativeName: S.of(context).no,
            // buttonNegativeAction: () => Navigator.of(context).pop()
          );
        },
        child: Text(
          url,
          style: TextStyle(fontSize: kNormalTextSize, color: colorAccent),
        ));
  }
}
