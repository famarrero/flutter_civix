import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/domain/entities/institution_menu_item.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/consult_state_fgr/cubit/consult_state_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_grid_institution_options.dart';
import 'package:flutter_civix/src/presentation/widgets/headers.dart';

class ServicesFgrPage extends StatefulWidget {
  @override
  _ServicesFgrPageState createState() => _ServicesFgrPageState();
}

class _ServicesFgrPageState extends State<ServicesFgrPage> {
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
                  Icon(Icons.dashboard_outlined, color: kFgrPrimaryColor),
                  SizedBox(width: 4),
                  Text('Servicios',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: kFgrPrimaryColor)),
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
          imagSrc: Icons.edit_outlined,
          title: "Write statment",
          color: kFgrPrimaryColor,
          onTap: () {
            var bloc = BlocProvider.of<WriteStatementFgrCubit>(context);
            AutoRouter.of(context).push(WriteStatementFgrPageRoute(bloc: bloc));
          }),
      InstitutionMenuItem(
          imagSrc: Icons.folder_outlined,
          title: "Statments list",
          color: kFgrPrimaryColor,
          onTap: () {
            var bloc = BlocProvider.of<ListStatementFgrCubit>(context);
            AutoRouter.of(context).push(ListStatementFgrPageRoute(bloc: bloc));
          }),
      InstitutionMenuItem(
          imagSrc: Icons.search_outlined,
          title: "Conslut statment",
          color: kFgrPrimaryColor,
          onTap: () {
            var bloc = BlocProvider.of<ConsultStateFgrCubit>(context);
            AutoRouter.of(context).push(ConsultStateFgrPageRoute(bloc: bloc));
          }),
    ];
  }
}

// class Slides extends StatefulWidget {
//   Function(double) page;
//
//   Slides({required this.page});
//
//   @override
//   SlidesState createState() => SlidesState();
// }
//
// class SlidesState extends State<Slides> {
//   final pageViewController = new PageController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     pageViewController.addListener(() {
//       // Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page;
//       widget.page(pageViewController.page!);
//       print(pageViewController.page);
//     });
//   }
//
//   @override
//   void dispose() {
//     pageViewController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: PageView(
//         controller: pageViewController,
//         children: <Widget>[
//           InstitutionOptions(
//             items: _getItemsInstitutionOptions(context),
//           ),
//           InstitutionOptions(
//             items: _getItemsInstitutionOptions(context),
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<InstitutionMenuItem> _getItemsInstitutionOptions(BuildContext context) {
//     return [
//       InstitutionMenuItem(
//           imagSrc: Icons.edit_outlined,
//           title: "Write statment",
//           color: Colors.blue,
//           onTap: () {
//             var bloc = BlocProvider.of<WriteStatementFgrCubit>(context);
//             AutoRouter.of(context).push(WriteStatementFgrPageRoute(bloc: bloc));
//           }),
//     ];
//   }
// }
