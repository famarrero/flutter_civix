import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/onbc/main_onbc/cubit/sidebar_onbc_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/sidebar_menu_item.dart';
import 'package:flutter_civix/src/presentation/widgets/sidebar_text_separator.dart';

import 'package:provider/provider.dart';

class SideBarOnbc extends StatelessWidget {
  const SideBarOnbc();

  @override
  Widget build(BuildContext context) {
    final routeName =
        AutoRouter.innerRouterOf(context, MainOnbcPageRoute.name)?.current.name;
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
              isActive: routeName == const ServicesOnbcPageRoute().routeName,
              text: S.of(context).services,
              icon: Icons.dashboard_outlined,
              onPressed: () {
                _onPressedItem(context, const ServicesOnbcPageRoute());
              }),
          const SizedBox(height: 30),
          SideBarTextSeparator(text: S.of(context).info),
          SideBarMenuItem(
              isActive: routeName == FrequentQuestionsPageRoute.name,
              text: S.of(context).frequentQuestions,
              icon: Icons.question_answer_outlined,
              onPressed: () {
                AutoRouter.of(context).push(FrequentQuestionsPageRoute(
                    primaryColor: kOnbcPrimaryColor,
                    secondaryColor: kOnbcSecondaryColor,
                    primarySwatch: kOnbcSecondaryMaterialColor,
                    jsonFaq: Assets.jsons.onbc.faqOnbc,
                    subtitle: S.of(context).onbc));
                context.read<SideBarOnbcCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              isActive: routeName == InformativeTextsPageRoute.name,
              text: S.of(context).history,
              icon: Icons.history_edu_outlined,
              onPressed: () {
                AutoRouter.of(context).push(InformativeTextsPageRoute(
                    primaryColor: kOnbcPrimaryColor,
                    secondaryColor: kOnbcSecondaryColor,
                    primarySwatch: kOnbcSecondaryMaterialColor,
                    subtitle: S.of(context).onbc,
                    jsonInformativeText: Assets.jsons.onbc.historyOnbc,
                    iconHeader: Icons.history_edu_outlined));
                context.read<SideBarOnbcCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              isActive: routeName == InformativeTextsPageRoute.name,
              text: S.of(context).missionAndVision,
              icon: Icons.workspaces_outline,
              onPressed: () {
                AutoRouter.of(context).push(InformativeTextsPageRoute(
                    primaryColor: kOnbcPrimaryColor,
                    secondaryColor: kOnbcSecondaryColor,
                    primarySwatch: kOnbcSecondaryMaterialColor,
                    subtitle: S.of(context).onbc,
                    jsonInformativeText: Assets.jsons.onbc.missionAndVisionOnbc,
                    iconHeader: Icons.workspaces_outline));
                context.read<SideBarOnbcCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              isActive: routeName == EntitiesByProvincePageRoute.name,
              text: S.of(context).dependencies,
              icon: Icons.account_balance_outlined,
              onPressed: () {
                AutoRouter.of(context).push(EntitiesListPageRoute(
                  primaryColor: kOnbcPrimaryColor,
                  secondaryColor: kOnbcSecondaryColor,
                  primarySwatch: kOnbcSecondaryMaterialColor,
                  title: S.of(context).dependencies,
                  subtitle: S.of(context).onbc,
                  entitiesByProvinceJson: Assets.jsons.onbc.dependencyOnbc,
                ));
                context.read<SideBarOnbcCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              isActive: routeName == ContactUsPageRoute.name,
              text: S.of(context).contactUs,
              icon: Icons.quick_contacts_dialer_outlined,
              onPressed: () {
                AutoRouter.of(context).push(ContactUsPageRoute(
                    primaryColor: kOnbcPrimaryColor,
                    secondaryColor: kOnbcSecondaryColor,
                    primarySwatch: kOnbcSecondaryMaterialColor,
                    subtitle: S.of(context).onbc,
                    jsonContactUs: Assets.jsons.onbc.contactUsOnbc,
                    imageHeader: Assets.images.contactenosOnbc.path));
                context.read<SideBarOnbcCubit>().closeMobileDrawable();
              }),
        ],
      ),
    );
  }

  Widget _buildLogoAndName(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: Assets.images.marcaAguaOnbc,
          height: 70,
          width: 70,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(S.of(context).onbc,
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
              textAlign: TextAlign.center),
        )
      ],
    );
  }

  void _onPressedItem(BuildContext context, PageRouteInfo routeInfo) {
    final currentRouteName =
        AutoRouter.innerRouterOf(context, MainOnbcPageRoute.name)?.current.name;
    if (currentRouteName == ServicesOnbcPageRoute.name) {
      AutoRouter.innerRouterOf(context, MainOnbcPageRoute.name)!.push(routeInfo);
    } else {
      if (routeInfo.routeName != ServicesOnbcPageRoute.name) {
        AutoRouter.innerRouterOf(context, MainOnbcPageRoute.name)!
            .replace(routeInfo);
      } else {
        AutoRouter.innerRouterOf(context, MainOnbcPageRoute.name)!.pop();
      }
    }

    context.read<SideBarOnbcCubit>().closeMobileDrawable();
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [kOnbcPrimaryColor, kOnbcSecondaryColor]),
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 10)]);
  }
}
