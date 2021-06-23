import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/core/utils/responsive.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/civix/main_civix/cubit/sidebar_cubit.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  const Navbar();

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool get showNab {
    return AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)?.current.name !=
        AboutUsPageRoute.name;
  }

  String getLocalizedTitleForRoute(BuildContext context, String routeName) {
    final localized = S.of(context);
    switch (routeName) {
      case InstitutionsListPageRoute.name:
        return localized.home;
      case QuickAccessPageRoute.name:
        return localized.quickAccess;
      case MyShipmentsPageRoute.name:
        return localized.myShipments;
      case FrequentQuestionsPageRoute.name:
        return localized.frequentQuestions;
      case SettingsPageRoute.name:
        return localized.settings;
      case ProfilePageRoute.name:
        return localized.profile;
      case AboutUsPageRoute.name:
        return localized.aboutUs;
      default:
        return localized.home;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)?.current;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: showNab ? kToolbarHeight : 0,
      width: double.infinity,
      decoration: _buildBoxDecoration(),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
                onPressed: () {
                  context.read<SideBarCubit>().openMovilDrawable();
                },
                icon: const Icon(Icons.menu_outlined),
                color: Colors.white),
          const SizedBox(
            width: 10,
          ),
          Text(getLocalizedTitleForRoute(context, data?.name ?? ''),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20)),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications, color: Colors.white)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.sync, color: Colors.white)),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(color: Theme.of(context).primaryColor,
      // gradient: LinearGradient(colors: [Color(0xff092044), Color(0xff092042)]),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
