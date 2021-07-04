import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/dimens.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/general/informative_texts/cubit/informative_texts_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/appbar_title.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_card.dart';

class InformativeTextsPage extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final MaterialColor primarySwatch;
  final String jsonInformativeText;
  final String subtitle;
  final IconData iconHeader;

  InformativeTextsPage(
      {Key? key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primarySwatch,
      required this.jsonInformativeText,
      required this.subtitle,
      required this.iconHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => injector<InformativeTextsCubit>()
          ..getInformativeText(jsonInformativeText),
        child: Theme(
          data: ThemeData(
              primaryColor: primaryColor,
              accentColor: secondaryColor,
              primarySwatch: primarySwatch),
          child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                title: AppBarTitleSubtitle(
                  title: S.of(context).info,
                  subtitle: subtitle,
                )),
            body: BlocBuilder<InformativeTextsCubit, InformativeTextsState>(
                builder: (context, state) {
              return ListView(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(iconHeader, color: Colors.white, size: 60),
                        SizedBox(height: 4),
                        if (state.informativeText != null)
                          Text(
                            state.informativeText!.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: kBigTextSize,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          )
                      ],
                    ),
                  ),
                  if (state.loading)
                    Container(
                        height: 200,
                        child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor))),
                  if (state.informativeText != null)
                    CustomCard(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          padding: EdgeInsets.all(16),
                          itemCount: state.informativeText!.textsList.length,
                          itemBuilder: (context, index) {
                            return _buildListFaq(context, state, index);
                          }),
                    ),
                ],
              );
            }),
          ),
        ));
  }

  _buildListFaq(BuildContext context, InformativeTextsState state, int index) {
    return ListTile(
        title: Text(state.informativeText!.textsList[index].text,
            style: (state.informativeText!.textsList[index].isHeader == true)
                ? _textStyleHeader(context)
                : _textStyleText(context)));
  }

  TextStyle _textStyleHeader(BuildContext context) {
    return TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: kNormalTextSize,
        fontWeight: FontWeight.w600);
  }

  TextStyle _textStyleText(BuildContext context) {
    return TextStyle(color: Colors.black45, fontSize: kNormalTextSize);
  }
}
