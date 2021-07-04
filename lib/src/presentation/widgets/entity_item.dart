import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/dimens.dart';
import 'package:flutter_civix/src/data/models/entity/coordinates_model.dart';
import 'package:flutter_civix/src/data/models/entity/entity_model.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_card.dart';
import 'package:flutter_civix/src/presentation/widgets/text_email.dart';
import 'package:flutter_civix/src/presentation/widgets/text_phone_number.dart';
import 'package:oktoast/oktoast.dart';

class EntityItem extends StatelessWidget {
  final EntityModel entity;
  final Color colorIcons;

  const EntityItem({Key? key, required this.entity, required this.colorIcons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: CustomCardTopRightCorner(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorIcons,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kCornersRadius),
                  topRight: Radius.circular(kDifferentCornerRadius),
                ),
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                child: Text(entity.entity!,
                    style: TextStyle(
                        color: Colors.white, fontSize: kNormalTextSize),
                    textAlign: TextAlign.center),
              ),
            ),
            SizedBox(height: 5),
            if (entity.province != null || entity.municipality != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.location_city_outlined,
                      color: colorIcons,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                          _getMunicipalityAndProvinceName(
                              entity.municipality, entity.province),
                          style: TextStyle(
                              color: Colors.black, fontSize: kNormalTextSize)),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            if (entity.address != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.location_pin,
                      color: colorIcons,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(entity.address!,
                          style: TextStyle(
                              color: Colors.black, fontSize: kNormalTextSize)),
                    ),
                    InkWell(
                        onTap: () {
                          _goToMap(context, entity.coordinates);
                        },
                        child: Icon(
                          Icons.map,
                          color: colorIcons,
                        )),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            if (entity.postalCode != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.mail_outline,
                      color: colorIcons,
                    ),
                    SizedBox(width: 10),
                    Text('${S.of(context).postalCodeAbbr}:',
                        style: TextStyle(
                            color: Theme.of(context)
                                .accentColor,
                            fontSize: kNormalTextSize,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    Text(entity.postalCode!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: kNormalTextSize)),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            if (entity.emailsList != null)
              _buildEmailsList(entity.emailsList!.toList()),
            if (entity.phonesList != null)
              _buildPhonesList(entity.phonesList!.toList()),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  _goToMap(BuildContext context, CoordinatesModel? coordinates) {
    if (coordinates != null) {
      print('Go to map');
    } else {
      showToast(S.of(context).noCoordinatesAvailable,
          duration: Duration(seconds: 3),
          position: ToastPosition.bottom,
          backgroundColor: Colors.black.withOpacity(0.7));
    }
  }

  String _getMunicipalityAndProvinceName(
      String? municipality, String? province) {
    String municipalityAndProvince = "";

    if (municipality != null && province != null) {
      municipalityAndProvince = "$municipality, $province";
    } else if (municipality != null) {
      municipalityAndProvince = municipality;
    } else if (province != null) {
      municipalityAndProvince = province;
    }
    return municipalityAndProvince;
  }

  _buildEmailsList(List<String> emailsList) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: emailsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.alternate_email_outlined,
                  color: colorIcons,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextEmail(
                      email: emailsList[index],
                      colorAccent: colorIcons)
                  // Text(emailsList[0],
                  //     style: TextStyle(
                  //         color: Colors.black, fontSize: kNormalTextSize)),
                ),
              ],
            ),
          );
        });
  }

  _buildPhonesList(List<String> phonesList) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: phonesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.phone,
                  color: colorIcons,
                ),
                SizedBox(width: 10),
                TextPhoneNumber(
                    phoneNumber: phonesList[index],
                    colorAccent: colorIcons)
                // Text(phonesList[index],
                //     style: TextStyle(
                //         color: Colors.black, fontSize: kNormalTextSize)),
              ],
            ),
          );
        });
  }
}