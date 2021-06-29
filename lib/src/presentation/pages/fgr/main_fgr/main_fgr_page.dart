import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/consult_state_fgr/cubit/consult_state_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/main_fgr/components/navbar_fgr.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/headers.dart';

import 'components/sidebar_fgr.dart';
import 'cubit/sidebar_fgr_cubit.dart';

class MainFgrPage extends StatefulWidget {
  MainFgrPage();

  @override
  _MainFgrPageState createState() => _MainFgrPageState();
}

class _MainFgrPageState extends State<MainFgrPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SideBarFgrCubit()),
        BlocProvider(create: (context) => injector<WriteStatementFgrCubit>()),
        BlocProvider(create: (context) => injector<ListStatementFgrCubit>()),
        BlocProvider(create: (context) => injector<ConsultStateFgrCubit>()),
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
          primaryColor: kFgrPrimaryColor,
          accentColor: kFgrSecondaryColor,
          primarySwatch: kFgrSecondaryMaterialColor),
      child: Container(
        color: kFgrPrimaryColor,
        child: SafeArea(
          child: Scaffold(
            key: context.read<SideBarFgrCubit>().scaffoldKey,
            endDrawer: SideBarFgr(),
            body: Column(
              children: [
                NavBarFgr(),
                InstitutionHeader(),
                Expanded(child: AutoRouter()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool get showBottomNavBar {
    final _currentPage =
        AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)?.current.name;
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
    return AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)
            ?.current
            .name ==
        routeName;
  }

  // void _onPressedBottomNavItem(BuildContext context, int index) {
  //   if (index == 0) {
  //     if (!_iAmAlreadyInThisPage(context, ServicesFgrPageRoute.name))
  //       _navigateBottomNavBar(context, ServicesFgrPageRoute());
  //   } else if (index == 1) {
  //     _navigateBottomNavBar(context, InfoFgrPageRoute());
  //   }
  // }

//   void _navigateBottomNavBar(BuildContext context, PageRouteInfo routeInfo) {
//     final currentRouteName =
//         AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)?.current.name;
//     if (currentRouteName == ServicesFgrPageRoute.name) {
//       AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)!.push(routeInfo);
//     } else {
//       if (routeInfo.routeName != ServicesFgrPageRoute.name) {
//         AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)!
//             .replace(routeInfo);
//       } else {
//         AutoRouter.innerRouterOf(context, MainFgrPageRoute.name)!.pop();
//       }
//     }
//   }
 }

class InstitutionHeader extends StatelessWidget {
  const InstitutionHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        alignment: Alignment.center,
        color: Colors.transparent,
        // color: Color(0xff1f2749),
        child: Stack(
          children: [
            HeaderWave(context, Theme.of(context).primaryColor),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(width: 24),
                      Image(
                          height: 90,
                          width: 90,
                          color: Colors.white,
                          image: Assets.images.marcaAguaFgr),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            S.of(context).fgr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  SliverCustomHeaderDelegate(
      {required this.minheight, required this.maxheight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

// CustomCarouselSlider(items: _getItemsCarousel()),
// List<ItemCarouselSlider> _getItemsCarousel() {
//   return [
//     ItemCarouselSlider(image: 'assets/images/fgr_marca_pais.png'),
//     ItemCarouselSlider(
//         text: 'Sus planteamientos son atendidos de manera rápida por nustros especialistas.',
//         image: 'assets/svgs/slide-3.svg'),
//     ItemCarouselSlider(
//         text: 'No estaremos prestando servicios los días 2 y 3 del presente mes.',
//         image: 'assets/svgs/slide-4.svg'),
//     ItemCarouselSlider(
//         text: 'Con Civix ahora es muy fácil presentar arguemtos a nuestra institución',
//         image: 'assets/svgs/slide-5.svg')
//   ];
// }
