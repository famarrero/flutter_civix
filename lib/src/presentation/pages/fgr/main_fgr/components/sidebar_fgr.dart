import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import '../../../../widgets/sidebar_menu_item.dart';
import '../../../../widgets/sidebar_text_separator.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/main_fgr/cubit/sidebar_fgr_cubit.dart';

import 'package:provider/provider.dart';

class SideBarFgr extends StatelessWidget {
  const SideBarFgr();

  @override
  Widget build(BuildContext context) {
    final routeName =
        AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)?.current.name;
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
              isActive: routeName == const ServicesFgrPageRoute().routeName,
              text: S.of(context).services,
              icon: Icons.dashboard_outlined,
              onPressed: () {
                _onPressedItem(context, const ServicesFgrPageRoute());
              }),
          const SizedBox(height: 30),
          SideBarTextSeparator(text: S.of(context).info),
          SideBarMenuItem(
              isActive: routeName == FrequentQuestionsPageRoute.name,
              text: S.of(context).frequentQuestions,
              icon: Icons.question_answer_outlined,
              onPressed: () {
                AutoRouter.of(context).push(FrequentQuestionsPageRoute(
                    primaryColor: kFgrPrimaryColor,
                    secondaryColor: kFgrSecondaryColor,
                    primarySwatch: kFgrSecondaryMaterialColor,
                    jsonFaq: Assets.jsons.faqFgr,
                    subtitle: S.of(context).fgr));
                context.read<SideBarFgrCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              isActive:
              routeName ==  InformativeTextsPageRoute.name,
              text: S.of(context).history,
              icon: Icons.history_edu_outlined,
              onPressed: () {
                AutoRouter.of(context).push(InformativeTextsPageRoute(
                    primaryColor: kFgrPrimaryColor,
                    secondaryColor: kFgrSecondaryColor,
                    primarySwatch: kFgrSecondaryMaterialColor,
                    subtitle: S.of(context).fgr,
                    jsonInformativeText: Assets.jsons.historyFgr,
                    iconHeader: Icons.history_edu_outlined));
                context.read<SideBarFgrCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              isActive:
              routeName ==  InformativeTextsPageRoute.name,
              text: S.of(context).missionAndFunctions,
              icon: Icons.workspaces_outline,
              onPressed: () {
                AutoRouter.of(context).push(InformativeTextsPageRoute(
                    primaryColor: kFgrPrimaryColor,
                    secondaryColor: kFgrSecondaryColor,
                    primarySwatch: kFgrSecondaryMaterialColor,
                    subtitle: S.of(context).fgr,
                    jsonInformativeText: Assets.jsons.missionAndFunctionsFgr,
                    iconHeader: Icons.workspaces_outline));
                context.read<SideBarFgrCubit>().closeMobileDrawable();
              }),
          SideBarMenuItem(
              // isActive:
              // routeName ==  FrequentQuestionsPageRoute().routeName,
              text: S.of(context).structure,
              icon: Icons.format_align_center_outlined,
              onPressed: () {
                // _onPressedItem(context,  FrequentQuestionsPageRoute());
              }),
          SideBarMenuItem(
              // isActive:
              //     routeName ==  FrequentQuestionsPageRoute().routeName,
              text: S.of(context).contactUs,
              icon: Icons.quick_contacts_dialer_outlined,
              onPressed: () {
                // _onPressedItem(context,  FrequentQuestionsPageRoute());
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
          image: Assets.images.marcaAguaFgr,
          height: 70,
          width: 70,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(S.of(context).fgr,
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
              textAlign: TextAlign.center),
        )
      ],
    );
  }

  void _onPressedItem(BuildContext context, PageRouteInfo routeInfo) {
    final currentRouteName =
        AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)?.current.name;
    if (currentRouteName == ServicesFgrPageRoute.name) {
      AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)!.push(routeInfo);
    } else {
      if (routeInfo.routeName != ServicesFgrPageRoute.name) {
        AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)!
            .replace(routeInfo);
      } else {
        AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)!.pop();
      }
    }

    context.read<SideBarFgrCubit>().closeMobileDrawable();
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [kFgrPrimaryColor, kFgrSecondaryColor]),
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 10)]);
  }
}
