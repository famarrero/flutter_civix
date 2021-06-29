import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/main_fgr/cubit/sidebar_fgr_cubit.dart';
import 'package:provider/provider.dart';


class NavBarFgr extends StatefulWidget {
  const NavBarFgr();

  @override
  _NavBarFgrState createState() => _NavBarFgrState();
}

class _NavBarFgrState extends State<NavBarFgr> {
  bool get showNab {
    final _currentPage =
        AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)
            ?.current
            .name;
    if (_currentPage == FrequentQuestionsPageRoute.name ||
        _currentPage == AboutUsPageRoute.name) {
      return false;
    } else {
      return true;
    }
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
        return localized.mainFGR;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data =
        AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)?.current;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: showNab ? kToolbarHeight : 0,
      width: double.infinity,
      decoration: _buildBoxDecoration(),
      child: Row(
        children: [
          SizedBox(width: 4),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sync, color: Colors.white)),
          IconButton(
              icon: Icon(Icons.qr_code_scanner, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.menu_outlined, color: Colors.white),
              onPressed: () {
                context.read<SideBarFgrCubit>().openMovilDrawable();
              })
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: kFgrPrimaryColor, //Color fgr
      // gradient: LinearGradient(colors: [Color(0xff092044), Color(0xff092042)]),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
