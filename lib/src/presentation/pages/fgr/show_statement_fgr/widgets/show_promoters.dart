import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/dimens.dart';
import 'package:flutter_civix/src/domain/entities/fgr/promoter_fgr.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/show_statement_fgr/widgets/show_promoter_dialg.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowPromoters extends StatelessWidget {
  final List<PromoterFRG> promoters;
  final Color colorIcons;

  ShowPromoters({required this.promoters, required this.colorIcons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(S.of(context).promoters,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: promoters.length,
                itemBuilder: (BuildContext context, int index) {
                  String title = '';
                  if (promoters[index].firstName != null &&
                      promoters[index].firstName!.isNotEmpty) {
                    title = '${promoters[index].firstName} ';
                  }
                  if (promoters[index].firstLastName != null &&
                      promoters[index].firstLastName!.isNotEmpty) {
                    title += '${promoters[index].firstLastName!}';
                  }
                  return Row(
                    children: [
                      Icon(FontAwesomeIcons.addressBook, size: 25,
                          color: colorIcons),
                      SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (title != '')
                              Text(title, style: TextStyle(
                                  fontSize: kNormalTextSize,
                                  color: Colors.black54)),
                            SizedBox(height: 2),
                            Text(
                                '${promoters[index]
                                    .municipalityName}, ${promoters[index]
                                    .provinceName}',
                                style: TextStyle(
                                    fontSize: kNormalTextSize,
                                    color: Colors.black54)),
                          ],
                        ),
                      ),
                      InkWell(
                        child: Icon(
                            FontAwesomeIcons.eye, size: 25, color: colorIcons),
                        onTap: () {
                          showDialog<void>(
                              context: context,
                              builder: (BuildContext dialogContext) =>
                                  ShowPromoterDialog(
                                    promoterFRG: promoters[index],
                                    colorIcons: colorIcons,
                                  ));
                        },
                      ),
                    ],
                  );
                }),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}