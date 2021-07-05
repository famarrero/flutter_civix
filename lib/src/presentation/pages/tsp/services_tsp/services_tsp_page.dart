import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/domain/entities/institution_menu_item.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_grid_institution_options.dart';

class ServicesTspPage extends StatefulWidget {
  @override
  _ServicesTspPageState createState() => _ServicesTspPageState();
}

class _ServicesTspPageState extends State<ServicesTspPage> {
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
                  Icon(Icons.dashboard_outlined, color: kTspPrimaryColor),
                  SizedBox(width: 4),
                  Text(S.of(context).services,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: kTspPrimaryColor)),
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
          title: S.of(context).writeStatement,
          color: kTspPrimaryColor,
          onTap: () {
            // var bloc = BlocProvider.of<WriteStatementFgrCubit>(context);
            // AutoRouter.of(context).push(WriteStatementFgrPageRoute(bloc: bloc));
          }),
      InstitutionMenuItem(
          imageSrc: Icons.folder_outlined,
          title: S.of(context).statementsList,
          color: kTspPrimaryColor,
          onTap: () {
            // var bloc = BlocProvider.of<ListStatementFgrCubit>(context);
            // AutoRouter.of(context).push(ListStatementFgrPageRoute(bloc: bloc));
          }),
      InstitutionMenuItem(
          imageSrc: Icons.search_outlined,
          title: S.of(context).consultState,
          color: kTspPrimaryColor,
          onTap: () {
            // var bloc = BlocProvider.of<ConsultStateFgrCubit>(context);
            // AutoRouter.of(context).push(ConsultStateFgrPageRoute(bloc: bloc));
          }),
    ];
  }
}