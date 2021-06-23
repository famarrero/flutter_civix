import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/civix/main_civix/cubit/sidebar_cubit.dart';
import 'package:provider/provider.dart';

import 'sidebar_menu_item.dart';
import 'sidebar_text_separator.dart';

class SideBar extends StatelessWidget {
  const SideBar();  

  @override
  Widget build(BuildContext context) {
    final routeName = AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)?.current.name;
    return Container(
      width: 250,
      height: double.infinity,
      decoration: _buildDecoration(context),
      child: ListView(
        children: [
          const SizedBox(height: 30),
          _buildLogoAndName(context),
          const SizedBox(height: 50),
          SideBarTextSeparator(text: S.of(context).main),
          SideBarMenuItem(
              isActive: routeName == const InstitutionsListPageRoute().routeName,
              text: S.of(context).home,
              icon: Icons.home_outlined,
              onPressed: () {
                _onPressedItem(context, const InstitutionsListPageRoute());
              }),
          SideBarMenuItem(
              isActive: routeName == const FrequentQuestionsPageRoute().routeName,
              text: S.of(context).frequentQuestions,
              icon: Icons.question_answer_outlined,
              onPressed: () {
                _onPressedItem(context, const FrequentQuestionsPageRoute());
              }),
          const SizedBox(height: 30),
          SideBarTextSeparator(text: S.of(context).more),
          SideBarMenuItem(
              isActive: routeName == const SettingsPageRoute().routeName,
              text: S.of(context).settings,
              icon: Icons.settings_outlined,
              onPressed: () {
                _onPressedItem(context, const SettingsPageRoute());
              }),
          SideBarMenuItem(
              isActive: routeName == const ProfilePageRoute().routeName,
              text: S.of(context).profile,
              icon: Icons.person_outline,
              onPressed: () {
                _onPressedItem(context, const ProfilePageRoute());
              }),
          SideBarMenuItem(
              isActive: routeName == const AboutUsPageRoute().routeName,
              text: S.of(context).aboutUs,
              icon: Icons.info_outline,
              onPressed: () {
                _onPressedItem(context, const AboutUsPageRoute());
              }),
        ],
      ),
    );
  }

  Widget _buildLogoAndName(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Icon(Icons.admin_panel_settings_outlined, size: 50, color: Color(0xff7A6BF5)),
        Image(
          image: Assets.images.icoCivixImagenLetrasOscuro,
          height: 70,
          width: 70,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(S.of(context).appSlogan,
              style: TextStyle(color: Colors.white.withOpacity(0.8)), textAlign: TextAlign.center),
        )
      ],
    );
  }

  void _onPressedItem(BuildContext context, PageRouteInfo routeInfo) {
    final currentRouteName =
        AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)?.current.name;
    if (currentRouteName == InstitutionsListPageRoute.name) {
      AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)!.push(routeInfo);
    } else {
      if (routeInfo.routeName != InstitutionsListPageRoute.name) {
        AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)!.replace(routeInfo);
      } else {
        AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)!.pop();
      }
    }

    context.read<SideBarCubit>().closeMobileDrawable();
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Color(0xff092042), Theme.of(context).primaryColor]),
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 10)]);
  }
}
