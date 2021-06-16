import 'package:flutter/material.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuBottomSheet {
  openMenuBottomSheet(
      {required BuildContext context,
      required int filesCount,
      required Function() openGallery,
      required Function() openDocuments}) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        elevation: 0,
        context: context,
        builder: (_) {
          return Container(
            height: 120,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: 'gallery',
                  tooltip: S.of(context).gallery,
                  backgroundColor: (filesCount < 3) ? Colors.red : Colors.black.withOpacity(0.1),
                  onPressed: (filesCount < 3) ? openGallery : null,
                  elevation: 0,
                  child: Icon(FontAwesomeIcons.fileImage),
                ),
                FloatingActionButton(
                  heroTag: 'documents',
                  tooltip: S.of(context).document,
                  backgroundColor: (filesCount < 3) ? Colors.green : Colors.black.withOpacity(0.1),
                  onPressed: (filesCount < 3) ? openDocuments : null,
                  elevation: 0,
                  child: Icon(FontAwesomeIcons.fileAlt),
                ),
                FloatingActionButton(
                  heroTag: 'location',
                  tooltip: S.of(context).location,
                  backgroundColor: Colors.orange,
                  onPressed: (filesCount < 3) ? () {} : null,
                  elevation: 0,
                  child: Icon(FontAwesomeIcons.locationArrow),
                ),
              ],
            ),
          );
        });
  }
}
