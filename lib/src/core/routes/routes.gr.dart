// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../presentation/pages/fgr/main_fgr_page.dart' as _i3;
import '../../presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart'
    as _i5;
import '../../presentation/pages/fgr/write_statement_fgr/write_statement_fgr_page.dart'
    as _i4;

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
    WriteStatementFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<WriteStatementFgrPageRouteArgs>();
          return _i4.WriteStatementFgrPage(bloc: args.bloc);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MainFGRPageRoute.name, path: '/'),
        _i1.RouteConfig(WriteStatementFgrPageRoute.name,
            path: '/write-statement-fgr-page')
      ];
}

class MainFGRPageRoute extends _i1.PageRouteInfo {
  const MainFGRPageRoute() : super(name, path: '/');

  static const String name = 'MainFGRPageRoute';
}

class WriteStatementFgrPageRoute
    extends _i1.PageRouteInfo<WriteStatementFgrPageRouteArgs> {
  WriteStatementFgrPageRoute({required _i5.WriteStatementFgrCubit bloc})
      : super(name,
            path: '/write-statement-fgr-page',
            args: WriteStatementFgrPageRouteArgs(bloc: bloc));

  static const String name = 'WriteStatementFgrPageRoute';
}

class WriteStatementFgrPageRouteArgs {
  const WriteStatementFgrPageRouteArgs({required this.bloc});

  final _i5.WriteStatementFgrCubit bloc;
}
