// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../presentation/pages/fgr/consult_state_fgr/consult_state_fgr_page.dart'
    as _i8;
import '../../presentation/pages/fgr/consult_state_fgr/cubit/consult_state_fgr_cubit.dart'
    as _i12;
import '../../presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart'
    as _i11;
import '../../presentation/pages/fgr/list_statement_fgr/list_statment_fgr_page.dart'
    as _i6;
import '../../presentation/pages/fgr/main_fgr_page.dart' as _i4;
import '../../presentation/pages/fgr/show_statement_fgr/show_statement_fgr_page.dart'
    as _i7;
import '../../presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart'
    as _i10;
import '../../presentation/pages/fgr/write_statement_fgr/write_statement_fgr_page.dart'
    as _i5;
import '../../presentation/pages/instituions_list.dart' as _i9;
import '../../presentation/pages/my_home_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MyHomePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.MyHomePage();
        }),
    MainFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.MainFgrPage();
        }),
    WriteStatementFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<WriteStatementFgrPageRouteArgs>();
          return _i5.WriteStatementFgrPage(bloc: args.bloc);
        }),
    ListStatementFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ListStatementFgrPageRouteArgs>();
          return _i6.ListStatementFgrPage(bloc: args.bloc);
        }),
    ShowStatementFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ShowStatementFgrPageRouteArgs>();
          return _i7.ShowStatementFgrPage(id: args.id);
        }),
    ConsultStateFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ConsultStateFgrPageRouteArgs>();
          return _i8.ConsultStateFgrPage(bloc: args.bloc);
        }),
    InstitutionsListPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.InstitutionsListPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MyHomePageRoute.name, path: '/', children: [
          _i1.RouteConfig(InstitutionsListPageRoute.name, path: '')
        ]),
        _i1.RouteConfig(MainFgrPageRoute.name, path: '/main-fgr-page'),
        _i1.RouteConfig(WriteStatementFgrPageRoute.name,
            path: '/write-statement-fgr-page'),
        _i1.RouteConfig(ListStatementFgrPageRoute.name,
            path: '/list-statement-fgr-page'),
        _i1.RouteConfig(ShowStatementFgrPageRoute.name,
            path: '/show-statement-fgr-page'),
        _i1.RouteConfig(ConsultStateFgrPageRoute.name,
            path: '/consult-state-fgr-page')
      ];
}

class MyHomePageRoute extends _i1.PageRouteInfo {
  const MyHomePageRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'MyHomePageRoute';
}

class MainFgrPageRoute extends _i1.PageRouteInfo {
  const MainFgrPageRoute() : super(name, path: '/main-fgr-page');

  static const String name = 'MainFgrPageRoute';
}

class WriteStatementFgrPageRoute
    extends _i1.PageRouteInfo<WriteStatementFgrPageRouteArgs> {
  WriteStatementFgrPageRoute({required _i10.WriteStatementFgrCubit bloc})
      : super(name,
            path: '/write-statement-fgr-page',
            args: WriteStatementFgrPageRouteArgs(bloc: bloc));

  static const String name = 'WriteStatementFgrPageRoute';
}

class WriteStatementFgrPageRouteArgs {
  const WriteStatementFgrPageRouteArgs({required this.bloc});

  final _i10.WriteStatementFgrCubit bloc;
}

class ListStatementFgrPageRoute
    extends _i1.PageRouteInfo<ListStatementFgrPageRouteArgs> {
  ListStatementFgrPageRoute({required _i11.ListStatementFgrCubit bloc})
      : super(name,
            path: '/list-statement-fgr-page',
            args: ListStatementFgrPageRouteArgs(bloc: bloc));

  static const String name = 'ListStatementFgrPageRoute';
}

class ListStatementFgrPageRouteArgs {
  const ListStatementFgrPageRouteArgs({required this.bloc});

  final _i11.ListStatementFgrCubit bloc;
}

class ShowStatementFgrPageRoute
    extends _i1.PageRouteInfo<ShowStatementFgrPageRouteArgs> {
  ShowStatementFgrPageRoute({required String id})
      : super(name,
            path: '/show-statement-fgr-page',
            args: ShowStatementFgrPageRouteArgs(id: id));

  static const String name = 'ShowStatementFgrPageRoute';
}

class ShowStatementFgrPageRouteArgs {
  const ShowStatementFgrPageRouteArgs({required this.id});

  final String id;
}

class ConsultStateFgrPageRoute
    extends _i1.PageRouteInfo<ConsultStateFgrPageRouteArgs> {
  ConsultStateFgrPageRoute({required _i12.ConsultStateFgrCubit bloc})
      : super(name,
            path: '/consult-state-fgr-page',
            args: ConsultStateFgrPageRouteArgs(bloc: bloc));

  static const String name = 'ConsultStateFgrPageRoute';
}

class ConsultStateFgrPageRouteArgs {
  const ConsultStateFgrPageRouteArgs({required this.bloc});

  final _i12.ConsultStateFgrCubit bloc;
}

class InstitutionsListPageRoute extends _i1.PageRouteInfo {
  const InstitutionsListPageRoute() : super(name, path: '');

  static const String name = 'InstitutionsListPageRoute';
}
