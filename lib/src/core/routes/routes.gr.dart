// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart'
    as _i7;
import '../../presentation/pages/fgr/list_statement_fgr/list_statment_fgr_page.dart'
    as _i5;
import '../../presentation/pages/fgr/main_fgr_page.dart' as _i3;
import '../../presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart'
    as _i6;
import '../../presentation/pages/fgr/write_statement_fgr/write_statement_fgr_page.dart'
    as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MainFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.MainFgrPage();
        }),
    WriteStatementFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<WriteStatementFgrPageRouteArgs>();
          return _i4.WriteStatementFgrPage(bloc: args.bloc);
        }),
    ListStatementFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ListStatementFgrPageRouteArgs>();
          return _i5.ListStatementFgrPage(bloc: args.bloc);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MainFgrPageRoute.name, path: '/'),
        _i1.RouteConfig(WriteStatementFgrPageRoute.name,
            path: '/write-statement-fgr-page'),
        _i1.RouteConfig(ListStatementFgrPageRoute.name,
            path: '/list-statement-fgr-page')
      ];
}

class MainFgrPageRoute extends _i1.PageRouteInfo {
  const MainFgrPageRoute() : super(name, path: '/');

  static const String name = 'MainFgrPageRoute';
}

class WriteStatementFgrPageRoute
    extends _i1.PageRouteInfo<WriteStatementFgrPageRouteArgs> {
  WriteStatementFgrPageRoute({required _i6.WriteStatementFgrCubit bloc})
      : super(name,
            path: '/write-statement-fgr-page',
            args: WriteStatementFgrPageRouteArgs(bloc: bloc));

  static const String name = 'WriteStatementFgrPageRoute';
}

class WriteStatementFgrPageRouteArgs {
  const WriteStatementFgrPageRouteArgs({required this.bloc});

  final _i6.WriteStatementFgrCubit bloc;
}

class ListStatementFgrPageRoute
    extends _i1.PageRouteInfo<ListStatementFgrPageRouteArgs> {
  ListStatementFgrPageRoute({required _i7.ListStatementFgrCubit bloc})
      : super(name,
            path: '/list-statement-fgr-page',
            args: ListStatementFgrPageRouteArgs(bloc: bloc));

  static const String name = 'ListStatementFgrPageRoute';
}

class ListStatementFgrPageRouteArgs {
  const ListStatementFgrPageRouteArgs({required this.bloc});

  final _i7.ListStatementFgrCubit bloc;
}
