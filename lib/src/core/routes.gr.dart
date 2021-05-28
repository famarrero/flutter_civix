// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../presentation/pages/fgr/main_fgr_page.dart' as _i3;
import '../presentation/pages/fgr/write_statment_fgr_page.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MainFGRPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.MainFGRPage();
        }),
    WriteStatmentFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.WriteStatmentFgrPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MainFGRPageRoute.name, path: '/'),
        _i1.RouteConfig(WriteStatmentFgrPageRoute.name,
            path: '/write-statment-fgr-page')
      ];
}

class MainFGRPageRoute extends _i1.PageRouteInfo {
  const MainFGRPageRoute() : super(name, path: '/');

  static const String name = 'MainFGRPageRoute';
}

class WriteStatmentFgrPageRoute extends _i1.PageRouteInfo {
  const WriteStatmentFgrPageRoute()
      : super(name, path: '/write-statment-fgr-page');

  static const String name = 'WriteStatmentFgrPageRoute';
}
