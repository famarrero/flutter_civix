import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/domain/entities/institution_menu_item.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_grid_institution_options.dart';

class ServicesOnbcPage extends StatefulWidget {
  @override
  _ServicesOnbcPageState createState() => _ServicesOnbcPageState();
}

class _ServicesOnbcPageState extends State<ServicesOnbcPage> {
  double page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.dashboard_outlined, color: kOnbcPrimaryColor),
                  SizedBox(width: 4),
                  Text(S.of(context).services,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: kOnbcPrimaryColor)),
                ],
              ),
            ],
          ),
          SizedBox(height: 32),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: InstitutionOptions(
                items: _getItemsInstitutionOptions(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<InstitutionMenuItem> _getItemsInstitutionOptions(BuildContext context) {
    return [
      InstitutionMenuItem(
          imageSrc: Icons.edit_outlined,
          title: S.of(context).writeQuestion,
          color: kOnbcPrimaryColor,
          onTap: () {
            // var bloc = BlocProvider.of<WriteStatementFgrCubit>(context);
            // AutoRouter.of(context).push(WriteStatementFgrPageRoute(bloc: bloc));
          }),
      InstitutionMenuItem(
          imageSrc: Icons.folder_outlined,
          title: S.of(context).questionsList,
          color: kOnbcPrimaryColor,
          onTap: () {
            // var bloc = BlocProvider.of<ListStatementFgrCubit>(context);
            // AutoRouter.of(context).push(ListStatementFgrPageRoute(bloc: bloc));
          }),
      InstitutionMenuItem(
          imageSrc: Icons.search_outlined,
          title: S.of(context).consultState,
          color: kOnbcPrimaryColor,
          onTap: () {
            // var bloc = BlocProvider.of<ConsultStateFgrCubit>(context);
            // AutoRouter.of(context).push(ConsultStateFgrPageRoute(bloc: bloc));
          }),
    ];
  }
}