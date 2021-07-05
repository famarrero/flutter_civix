import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/tsp/main_tsp/components/navbar_tsp.dart';
import 'package:flutter_civix/src/presentation/pages/tsp/main_tsp/components/sidebar_tsp.dart';
import 'package:flutter_civix/src/presentation/pages/tsp/main_tsp/cubit/sidebar_tsp_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/institution_header.dart';

class MainTspPage extends StatefulWidget {
  MainTspPage();

  @override
  _MainTspPageState createState() => _MainTspPageState();
}

class _MainTspPageState extends State<MainTspPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SideBarTspCubit()),
        // BlocProvider(create: (context) => injector<WriteStatementFgrCubit>()),
        // BlocProvider(create: (context) => injector<ListStatementFgrCubit>()),
        // BlocProvider(create: (context) => injector<ConsultStateFgrCubit>()),
      ],
      child: _ScaffoldMainTspPage(),
    );
  }
}

class _ScaffoldMainTspPage extends StatefulWidget {
  @override
  _ScaffoldMainTspPageState createState() => _ScaffoldMainTspPageState();
}

class _ScaffoldMainTspPageState extends State<_ScaffoldMainTspPage> {
  bool? checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: kTspPrimaryColor,
          accentColor: kTspSecondaryColor,
          primarySwatch: kTspSecondaryMaterialColor),
      child: Container(
        color: kTspPrimaryColor,
        child: SafeArea(
          child: Scaffold(
            key: context.read<SideBarTspCubit>().scaffoldKey,
            endDrawer: SideBarTsp(),
            body: Column(
              children: [
                NavBarTsp(),
                InstitutionHeader(
                  institutionName: S.of(context).tsp,
                  color: kTspPrimaryColor,
                  image: Assets.images.marcaAguaTsp.path,
                ),
                Expanded(child: AutoRouter()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
