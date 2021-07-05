import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/onbc/main_onbc/components/navbar_onbc.dart';
import 'package:flutter_civix/src/presentation/pages/onbc/main_onbc/components/sidebar_onbc.dart';
import 'package:flutter_civix/src/presentation/pages/onbc/main_onbc/cubit/sidebar_onbc_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/institution_header.dart';

class MainOnbcPage extends StatefulWidget {
  MainOnbcPage();

  @override
  _MainOnbcPageState createState() => _MainOnbcPageState();
}

class _MainOnbcPageState extends State<MainOnbcPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SideBarOnbcCubit()),
        // BlocProvider(create: (context) => injector<WriteStatementFgrCubit>()),
        // BlocProvider(create: (context) => injector<ListStatementFgrCubit>()),
        // BlocProvider(create: (context) => injector<ConsultStateFgrCubit>()),
      ],
      child: _ScaffoldMainOnbcPage(),
    );
  }
}

class _ScaffoldMainOnbcPage extends StatefulWidget {
  @override
  _ScaffoldMainOnbcPageState createState() => _ScaffoldMainOnbcPageState();
}

class _ScaffoldMainOnbcPageState extends State<_ScaffoldMainOnbcPage> {
  bool? checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: kOnbcPrimaryColor,
          accentColor: kOnbcSecondaryColor,
          primarySwatch: kOnbcSecondaryMaterialColor),
      child: Container(
        color: kOnbcPrimaryColor,
        child: SafeArea(
          child: Scaffold(
            key: context.read<SideBarOnbcCubit>().scaffoldKey,
            endDrawer: SideBarOnbc(),
            body: Column(
              children: [
                NavBarOnbc(),
                InstitutionHeader(
                  institutionName: S.of(context).onbc,
                  color: kOnbcPrimaryColor,
                  image: Assets.images.marcaAguaOnbc.path,
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
