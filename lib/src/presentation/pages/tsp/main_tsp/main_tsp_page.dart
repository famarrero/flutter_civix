import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/pages/tsp/main_tsp/components/navbar_tsp.dart';
import 'package:flutter_civix/src/presentation/widgets/intitution_header.dart';

import 'components/sidebar_tsp.dart';
import 'cubit/sidebar_tsp_cubit.dart';

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
                  institutionName: 'Tribunal Supremo Popular',
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



