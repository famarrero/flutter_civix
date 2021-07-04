import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/dimens.dart';
import 'package:flutter_civix/src/core/services_manager/url_launcher_manager.dart';
import 'package:flutter_civix/src/data/models/entity/coordinates_model.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/general/contact_us/cubit/contact_us_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/appbar_title.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_card.dart';
import 'package:flutter_civix/src/presentation/widgets/text_email.dart';
import 'package:flutter_civix/src/presentation/widgets/text_phone_number.dart';
import 'package:flutter_civix/src/presentation/widgets/text_url.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oktoast/oktoast.dart';

class ContactUsPage extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final MaterialColor primarySwatch;
  final String jsonContactUs;
  final String subtitle;
  final String imageHeader;

  ContactUsPage(
      {Key? key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primarySwatch,
      required this.jsonContactUs,
      required this.subtitle,
      required this.imageHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            injector<ContactUsCubit>()..getContactUs(jsonContactUs),
        child: Theme(
          data: ThemeData(
              primaryColor: primaryColor,
              accentColor: secondaryColor,
              primarySwatch: primarySwatch),
          child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                title: AppBarTitleSubtitle(
                  title: S.of(context).contactUs,
                  subtitle: subtitle,
                )),
            body: BlocBuilder<ContactUsCubit, ContactUsState>(
                builder: (context, state) {
              return ListView(
                children: [
                  Container(
                      height: 150,
                      width: double.infinity,
                      color: Colors.white,
                      child: Image.asset(imageHeader, fit: BoxFit.cover,)),
                  if (state.loading)
                    Container(
                        height: 200,
                        child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor))),
                  if (state.contactUs != null)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Text(S.of(context).whereWeAre,
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontSize: kSmallTextSize)),
                                ),
                                if (state.contactUs!.province != null ||
                                    state.contactUs!.municipality != null)
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.location_city_outlined,
                                          color: Theme.of(context).accentColor,
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              _getMunicipalityAndProvinceName(
                                                  state.contactUs!.municipality,
                                                  state.contactUs!.province),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: kNormalTextSize)),
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    ),
                                  ),
                                if (state.contactUs!.address != null)
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.location_pin,
                                          color: Theme.of(context).accentColor,
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(state.contactUs!.address!,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: kNormalTextSize)),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              _goToMap(context,
                                                  state.contactUs!.coordinates);
                                            },
                                            child: Icon(
                                              Icons.map,
                                              color:
                                                  Theme.of(context).accentColor,
                                            )),
                                        SizedBox(width: 10),
                                      ],
                                    ),
                                  ),
                                if (state.contactUs!.postalCode != null)
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.mail_outline,
                                          color: Theme.of(context).accentColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text('${S.of(context).postalCodeAbbr}:',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontSize: kNormalTextSize,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 10),
                                        Text(state.contactUs!.postalCode!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: kNormalTextSize)),
                                        SizedBox(width: 10),
                                      ],
                                    ),
                                  ),
                                SizedBox(height: 5)
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          if (state.contactUs!.emailsList != null)
                            CustomCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 45, top: 10),
                                    child: Text(S.of(context).emails,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: kSmallTextSize)),
                                  ),
                                  _buildEmailsList(
                                      state.contactUs!.emailsList!.toList()),
                                  SizedBox(height: 5)
                                ],
                              ),
                            ),
                          SizedBox(height: 10),
                          if (state.contactUs!.phonesList != null)
                            CustomCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 45, top: 10),
                                    child: Text(S.of(context).phones,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: kSmallTextSize)),
                                  ),
                                  _buildPhonesList(
                                      state.contactUs!.phonesList!.toList()),
                                  SizedBox(height: 5)
                                ],
                              ),
                            ),
                          SizedBox(height: 10),
                          if (state.contactUs!.linksList != null)
                            CustomCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 45, top: 10),
                                    child: Text(S.of(context).links,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: kSmallTextSize)),
                                  ),
                                  _buildLinksList(
                                      state.contactUs!.linksList!.toList()),
                                  SizedBox(height: 5)
                                ],
                              ),
                            ),
                          SizedBox(height: 10),
                          CustomCard(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (state.contactUs!.facebook != null)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: IconButton(
                                      icon: Icon(FontAwesomeIcons.facebook,
                                          color: Theme.of(context).accentColor),
                                      onPressed: () {
                                        injector<UrlLauncherManager>()
                                          ..openUrl(state.contactUs!.facebook!);
                                      },
                                    ),
                                  ),
                                if (state.contactUs!.twitter != null)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: IconButton(
                                      icon: Icon(FontAwesomeIcons.twitter,
                                          color: Theme.of(context).accentColor),
                                      onPressed: () {
                                        injector<UrlLauncherManager>()
                                          ..openUrl(state.contactUs!.twitter!);
                                      },
                                    ),
                                  ),
                                if (state.contactUs!.youtube != null)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: IconButton(
                                      icon: Icon(FontAwesomeIcons.youtube,
                                          color: Theme.of(context).accentColor),
                                      onPressed: () {
                                        injector<UrlLauncherManager>()
                                          ..openUrl(state.contactUs!.youtube!);
                                      },
                                    ),
                                  ),
                                if (state.contactUs!.telegram != null)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: IconButton(
                                      icon: Icon(FontAwesomeIcons.telegram,
                                          color: Theme.of(context).accentColor),
                                      onPressed: () {
                                        injector<UrlLauncherManager>()
                                          ..openUrl(state.contactUs!.telegram!);
                                      },
                                    ),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ],
              );
            }),
          ),
        ));
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
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(width: 10),
                Expanded(
                    child: TextEmail(
                        email: emailsList[index],
                        colorAccent: Theme.of(context).accentColor)),
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
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(width: 10),
                TextPhoneNumber(
                    phoneNumber: phonesList[index],
                    colorAccent: Theme.of(context).accentColor)
              ],
            ),
          );
        });
  }

  _buildLinksList(List<String> linksList) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: linksList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.link,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(width: 10),
                Expanded(
                    child: TextUrl(
                  url: linksList[0],
                  colorAccent: Theme.of(context).accentColor,
                )),
              ],
            ),
          );
        });
  }
}
