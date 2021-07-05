import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/consult_state_fgr/cubit/consult_state_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/main_fgr/components/navbar_fgr.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/main_fgr/components/sidebar_fgr.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/main_fgr/cubit/sidebar_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/institution_header.dart';

class MainFgrPage extends StatefulWidget {
  MainFgrPage();

  @override
  _MainFgrPageState createState() => _MainFgrPageState();
}

class _MainFgrPageState extends State<MainFgrPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SideBarFgrCubit()),
        BlocProvider(create: (context) => injector<WriteStatementFgrCubit>()),
        BlocProvider(create: (context) => injector<ListStatementFgrCubit>()),
        BlocProvider(create: (context) => injector<ConsultStateFgrCubit>()),
      ],
      child: _ScaffoldMainFGRPage(),
    );
  }
}

class _ScaffoldMainFGRPage extends StatefulWidget {
  @override
  __ScaffoldMainFGRPageState createState() => __ScaffoldMainFGRPageState();
}

class __ScaffoldMainFGRPageState extends State<_ScaffoldMainFGRPage> {
  bool? checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: kFgrPrimaryColor,
          accentColor: kFgrSecondaryColor,
          primarySwatch: kFgrSecondaryMaterialColor),
      child: Container(
        color: kFgrPrimaryColor,
        child: SafeArea(
          child: Scaffold(
            key: context.read<SideBarFgrCubit>().scaffoldKey,
            endDrawer: SideBarFgr(),
            body: Column(
              children: [
                NavBarFgr(),
                InstitutionHeader(
                  institutionName: S.of(context).fgr,
                  color: kFgrPrimaryColor,
                  image: Assets.images.marcaAguaFgr.path,
                ),
                Expanded(child: AutoRouter()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool get showBottomNavBar {
    final _currentPage =
        AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)?.current.name;
    if (_currentPage == FrequentQuestionsPageRoute.name ||
        _currentPage == SettingsPageRoute.name ||
        _currentPage == ProfilePageRoute.name ||
        _currentPage == AboutUsPageRoute.name) {
      return false;
    } else {
      return true;
    }
  }
}
