import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/tsp/main_tsp/cubit/sidebar_tsp_cubit.dart';
import '../../../../widgets/sidebar_menu_item.dart';
import '../../../../widgets/sidebar_text_separator.dart';

import 'package:provider/provider.dart';

class SideBarTsp extends StatelessWidget {
  const SideBarTsp();

  @override
  Widget build(BuildContext context) {
    final routeName =
        AutoRouter.innerRouterOf(context, MainTspPageRoute.name)?.current.name;
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
              isActive: routeName == const ServicesTspPageRoute().routeName,
              text: S.of(context).services,
              icon: Icons.dashboard_outlined,
              onPressed: () {
                _onPressedItem(context, const ServicesTspPageRoute());
              }),
          const SizedBox(height: 30),
          SideBarTextSeparator(text: S.of(context).info),
          SideBarMenuItem(
              isActive: routeName == FrequentQuestionsPageRoute.name,
              text: S.of(context).frequentQuestions,
              icon: Icons.question_answer_outlined,
              onPressed: () {
                AutoRouter.of(context).push(FrequentQuestionsPageRoute(
                    primaryColor: kTspPrimaryColor,
                    secondaryColor: kTspSecondaryColor,
                    primarySwatch: kTspSecondaryMaterialColor,
                    jsonFaq: Assets.jsons.tsp.faqTsp,
                    subtitle: S.of(context).tsp));
                context.read<SideBarTspCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              isActive: routeName == InformativeTextsPageRoute.name,
              text: S.of(context).history,
              icon: Icons.history_edu_outlined,
              onPressed: () {
                AutoRouter.of(context).push(InformativeTextsPageRoute(
                    primaryColor: kTspPrimaryColor,
                    secondaryColor: kTspSecondaryColor,
                    primarySwatch: kTspSecondaryMaterialColor,
                    subtitle: S.of(context).tsp,
                    jsonInformativeText: Assets.jsons.tsp.historyTsp,
                    iconHeader: Icons.history_edu_outlined));
                context.read<SideBarTspCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              isActive: routeName == InformativeTextsPageRoute.name,
              // text: S.of(context).missionAndFunctions,
              text: S.of(context).missionAndVision,
              icon: Icons.workspaces_outline,
              onPressed: () {
                AutoRouter.of(context).push(InformativeTextsPageRoute(
                    primaryColor: kTspPrimaryColor,
                    secondaryColor: kTspSecondaryColor,
                    primarySwatch: kTspSecondaryMaterialColor,
                    subtitle: S.of(context).tsp,
                    jsonInformativeText: Assets.jsons.tsp.missionAndVisionTsp,
                    iconHeader: Icons.workspaces_outline));
                context.read<SideBarTspCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              isActive: routeName == EntitiesByProvincePageRoute.name,
              text: S.of(context).courtRooms,
              icon: Icons.account_tree_outlined,
              onPressed: () {
                AutoRouter.of(context).push(InformativeTextsPageRoute(
                    primaryColor: kTspPrimaryColor,
                    secondaryColor: kTspSecondaryColor,
                    primarySwatch: kTspSecondaryMaterialColor,
                    subtitle: S.of(context).tsp,
                    jsonInformativeText: Assets.jsons.tsp.courtroomsTsp,
                    iconHeader: Icons.account_tree_outlined));
                context.read<SideBarTspCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              isActive: routeName == EntitiesByProvincePageRoute.name,
              text: S.of(context).provincialCourts,
              icon: Icons.account_balance_outlined,
              onPressed: () {
                AutoRouter.of(context).push(EntitiesByProvincePageRoute(
                  primaryColor: kTspPrimaryColor,
                  secondaryColor: kTspSecondaryColor,
                  primarySwatch: kTspSecondaryMaterialColor,
                  title: S.of(context).provincialCourts,
                  subtitle: S.of(context).tsp,
                  entitiesByProvinceJson: Assets.jsons.tsp.dependencyTsp,
                ));
                context.read<SideBarTspCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              isActive: routeName == ContactUsPageRoute.name,
              text: S.of(context).contactUs,
              icon: Icons.quick_contacts_dialer_outlined,
              onPressed: () {
                AutoRouter.of(context).push(ContactUsPageRoute(
                    primaryColor: kTspPrimaryColor,
                    secondaryColor: kTspSecondaryColor,
                    primarySwatch: kTspSecondaryMaterialColor,
                    subtitle: S.of(context).tsp,
                    jsonContactUs: Assets.jsons.tsp.contactUsTsp,
                    imageHeader: Assets.images.contactenosTsp.path));
                context.read<SideBarTspCubit>().closeMobileDrawable();
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
          image: Assets.images.marcaAguaTsp,
          height: 70,
          width: 70,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(S.of(context).tsp,
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
              textAlign: TextAlign.center),
        )
      ],
    );
  }

  void _onPressedItem(BuildContext context, PageRouteInfo routeInfo) {
    final currentRouteName =
        AutoRouter.innerRouterOf(context, MainTspPageRoute.name)?.current.name;
    if (currentRouteName == ServicesTspPageRoute.name) {
      AutoRouter.innerRouterOf(context, MainTspPageRoute.name)!.push(routeInfo);
    } else {
      if (routeInfo.routeName != ServicesTspPageRoute.name) {
        AutoRouter.innerRouterOf(context, MainTspPageRoute.name)!
            .replace(routeInfo);
      } else {
        AutoRouter.innerRouterOf(context, MainTspPageRoute.name)!.pop();
      }
    }

    context.read<SideBarTspCubit>().closeMobileDrawable();
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [kTspPrimaryColor, kTspSecondaryColor]),
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 10)]);
  }
}
