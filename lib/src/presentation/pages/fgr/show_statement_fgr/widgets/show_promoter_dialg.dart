import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/constants.dart';
import 'package:flutter_civix/src/domain/entities/fgr/promoter_fgr.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_dialog_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowPromoterDialog extends StatelessWidget {
  final PromoterFRG promoterFRG;

  ShowPromoterDialog({required this.promoterFRG});

  @override
  Widget build(BuildContext context) {
    String? firstName = promoterFRG.firstName;
    String? secondName = promoterFRG.secondName;
    String? firstLastName = promoterFRG.firstLastName;
    String? secondLastName = promoterFRG.secondLastName;
    String? id = promoterFRG.id;
    String? phone = promoterFRG.phone;
    String? email = promoterFRG.email;
    String? provinceName = promoterFRG.provinceName;
    String? municipalityName = promoterFRG.municipalityName;
    String? address = promoterFRG.address;

    String promoterNameToShow = '';
    if (firstName != null && firstName.isNotEmpty) promoterNameToShow += firstName;
    if (secondName != null && secondName.isNotEmpty) promoterNameToShow += ' ' + secondName;
    if (firstLastName != null && firstLastName.isNotEmpty)
      promoterNameToShow += ' ' + firstLastName;
    if (secondLastName != null && secondLastName.isNotEmpty)
      promoterNameToShow += ' ' + secondLastName;

    String municipalityAndProvinceToShow = '';
    if (municipalityName != null && municipalityName.isNotEmpty)
      municipalityAndProvinceToShow += municipalityName;
    if (provinceName != null && provinceName.isNotEmpty)
      municipalityAndProvinceToShow += ', ' + provinceName;

    return CustomDialogBox(
        title: 'Promoter',
        icon: FontAwesomeIcons.addressBook,
        sizeIcon: 30,
        body: Column(       
          children: [
            if (promoterNameToShow.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.person, color: Colors.blue, size: Constants.normalIconSize),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(promoterNameToShow,
                          style: TextStyle(fontSize: Constants.normalTextSize)),
                    ),
                  ],
                ),
              ),
            if (id != null && id.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.vpn_key, color: Colors.blue, size: Constants.normalIconSize),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(id, style: TextStyle(fontSize: Constants.normalTextSize)),
                    ),
                  ],
                ),
              ),
            if (phone != null && phone.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.phone, color: Colors.blue, size: Constants.normalIconSize),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(phone, style: TextStyle(fontSize: Constants.normalTextSize)),
                    ),
                  ],
                ),
              ),
            if (email != null && email.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.alternate_email, color: Colors.blue, size: Constants.normalIconSize),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(email, style: TextStyle(fontSize: Constants.normalTextSize)),
                    ),
                  ],
                ),
              ),
            if (municipalityAndProvinceToShow.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.location_city, color: Colors.blue, size: Constants.normalIconSize),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(municipalityAndProvinceToShow,
                          style: TextStyle(fontSize: Constants.normalTextSize)),
                    ),
                  ],
                ),
              ),
            if (address != null && address.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.location_pin, color: Colors.blue, size: Constants.normalIconSize),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(address, style: TextStyle(fontSize: Constants.normalTextSize)),
                    ),
                  ],
                ),
              ),
          ],
        ),
        buttonPositiveName: 'Ok');
  }
}