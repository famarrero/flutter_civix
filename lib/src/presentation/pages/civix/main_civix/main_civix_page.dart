import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/core/utils/responsive.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/civix/main_civix/components/navbar.dart';
import 'package:flutter_civix/src/presentation/pages/civix/main_civix/components/sidebar.dart';
import 'package:flutter_civix/src/presentation/pages/civix/main_civix/cubit/sidebar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

class MainCivixPage extends StatefulWidget {
  const MainCivixPage({Key? key}) : super(key: key);

  @override
  _MainCivixPageState createState() => _MainCivixPageState();
}

class _MainCivixPageState extends State<MainCivixPage> {
  DateTime? _currentBackPressedTime;
  int _bottomNavBarIndex = -1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SideBarCubit()),
          ],
          child: BlocBuilder<SideBarCubit, bool>(builder: (context, state) {
            return Container(
              color: Theme.of(context).primaryColor,
              child: SafeArea(
                child: Scaffold(
                    key: context.read<SideBarCubit>().scaffoldKey,
                    drawer: (Responsive.isDesktop(context))
                        ? null
                        : const SideBarCivix(),
                    body: Row(
                      children: [
                        // We want this side menu only for large screen
                        if (Responsive.isDesktop(context)) const SideBarCivix(),
                        Expanded(
                          child: Column(
                            children: [
                              const NavBarCivix(),
                              const Expanded(child: Center(child: AutoRouter()))
                            ],
                          ),
                        ),
                      ],
                    ),
                    floatingActionButton: Visibility(
                      visible: showBottomNavBar,
                      child: FloatingActionButton(
                        child: Icon(Icons.home_filled),
                        backgroundColor: !_iAmAlreadyInThisPage(
                                context, InstitutionsListPageRoute.name)
                            ? Colors.blueGrey
                            : Colors.blue,
                        onPressed: _iAmAlreadyInThisPage(
                                context, InstitutionsListPageRoute.name)
                            ? null
                            : () {
                                setState(() {
                                  _bottomNavBarIndex = -1;
                                });
                                _navigateBottomNavBar(
                                    context, InstitutionsListPageRoute());
                              },
                      ),
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerDocked,
                    bottomNavigationBar: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: showBottomNavBar ? kToolbarHeight : 0,
                        width: double.infinity,
                        child: Wrap(children: [
                          AnimatedBottomNavigationBar(
                            icons: [
                              Icons.touch_app_outlined,
                              Icons.list_alt_outlined
                            ],
                            activeColor: Colors.blue,
                            inactiveColor: Colors.blueGrey,
                            gapLocation: GapLocation.center,
                            notchSmoothness: NotchSmoothness.softEdge,
                            leftCornerRadius: 32,
                            rightCornerRadius: 32,
                            activeIndex: _iAmAlreadyInThisPage(
                                    context, InstitutionsListPageRoute.name)
                                ? -1
                                : _bottomNavBarIndex,
                            onTap: (index) => setState(() {
                              print(index);
                              _bottomNavBarIndex = index;
                              _onPressedBottomNavItem(context, index);
                            }),
                          ),
                        ]))),
              ),
            );
          })),
    );
  }

  bool get showBottomNavBar {
    final _currentPage =
        AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)
            ?.current
            .name;
    if (_currentPage == FrequentQuestionsPageRoute.name ||
        _currentPage == SettingsPageRoute.name ||
        _currentPage == ProfilePageRoute.name ||
        _currentPage == AboutUsPageRoute.name) {
      return false;
    } else {
      return true;
    }
  }

  bool _iAmAlreadyInThisPage(BuildContext context, String routeName) {
    return AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)
            ?.current
            .name ==
        routeName;
  }

  void _onPressedBottomNavItem(BuildContext context, int index) {
    if (index == 0) {
      _navigateBottomNavBar(context, QuickAccessPageRoute());
    } else if (index == 1) {
      _navigateBottomNavBar(context, MyShipmentsPageRoute());
    }
  }

  void _navigateBottomNavBar(BuildContext context, PageRouteInfo routeInfo) {
    final currentRouteName =
        AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)
            ?.current
            .name;
    if (currentRouteName == InstitutionsListPageRoute.name) {
      AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)!
          .push(routeInfo);
    } else {
      if (routeInfo.routeName != InstitutionsListPageRoute.name) {
        AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)!
            .replace(routeInfo);
      } else {
        AutoRouter.innerRouterOf(context, MainCivixPageRoute.name)!.pop();
      }
    }
  }

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (_currentBackPressedTime == null ||
        now.difference(_currentBackPressedTime!) > Duration(seconds: 2)) {
      _currentBackPressedTime = now;
      showToast(S.of(context).pressAgainToExit,
          duration: Duration(seconds: 2),
          position: ToastPosition.bottom,
          backgroundColor: Colors.black.withOpacity(0.7));
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}