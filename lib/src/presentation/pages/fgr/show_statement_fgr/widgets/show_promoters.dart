import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/constants.dart';
import 'package:flutter_civix/src/domain/entities/fgr/promoter_fgr.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/show_statement_fgr/widgets/show_promoter_dialg.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowPromoters extends StatelessWidget {
  final List<PromoterFRG> _promoters;

  ShowPromoters(this._promoters);

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
              child: Text('Promotres',
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
                itemCount: _promoters.length,
                itemBuilder: (BuildContext context, int index) {
                  String title = '';
                  if (_promoters[index].firstName != null &&
                      _promoters[index].firstName!.isNotEmpty) {
                    title = '${_promoters[index].firstName} ';
                  }
                  if (_promoters[index].firstLastName != null &&
                      _promoters[index].firstLastName!.isNotEmpty) {
                    title += '${_promoters[index].firstLastName!}';
                  }
                  return Row(
                    children: [
                      Icon(FontAwesomeIcons.addressBook, size: 25, color: Colors.blue),
                      SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (title != '')
                              Text(title, style: TextStyle(fontSize: Constants.normalTextSize, color: Colors.black54)),
                            SizedBox(height: 2),
                            Text(
                                '${_promoters[index].municipalityName}, ${_promoters[index].provinceName}',
                                style: TextStyle(fontSize: Constants.normalTextSize, color: Colors.black54)),
                          ],
                        ),
                      ),
                      InkWell(
                        child: Icon(FontAwesomeIcons.eye, size: 25, color: Colors.blue),
                        onTap: () {
                          showDialog<void>(
                              context: context,
                              builder: (BuildContext dialogContext) => ShowPromoterDialog(
                                    promoterFRG: _promoters[index],
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