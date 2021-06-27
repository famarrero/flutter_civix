// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../presentation/pages/civix/about_us/about_us_page.dart' as _i12;
import '../../presentation/pages/civix/frequent_questions/frequent_questions_page.dart'
    as _i13;
import '../../presentation/pages/civix/institutions_list/institutions_list_page.dart'
    as _i9;
import '../../presentation/pages/civix/main_civix/main_civix_page.dart' as _i3;
import '../../presentation/pages/civix/my_shipments/my_shipments_page.dart'
    as _i11;
import '../../presentation/pages/civix/profile/profile_page.dart' as _i14;
import '../../presentation/pages/civix/quick_access/quick_access_page.dart'
    as _i10;
import '../../presentation/pages/civix/settings/settings_page.dart' as _i15;
import '../../presentation/pages/fgr/consult_state_fgr/consult_state_fgr_page.dart'
    as _i8;
import '../../presentation/pages/fgr/consult_state_fgr/cubit/consult_state_fgr_cubit.dart'
    as _i20;
import '../../presentation/pages/fgr/info_fgr/info_fgr_page.dart' as _i17;
import '../../presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart'
    as _i19;
import '../../presentation/pages/fgr/list_statement_fgr/list_statement_fgr_page.dart'
    as _i6;
import '../../presentation/pages/fgr/main_fgr/main_fgr_page.dart' as _i4;
import '../../presentation/pages/fgr/services_fgr/services_fgr_page.dart'
    as _i16;
import '../../presentation/pages/fgr/show_statement_fgr/show_statement_fgr_page.dart'
    as _i7;
import '../../presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart'
    as _i18;
import '../../presentation/pages/fgr/write_statement_fgr/write_statement_fgr_page.dart'
    as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MainCivixPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.MainCivixPage();
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
        }),
    QuickAccessPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.QuickAccessPage();
        }),
    MyShipmentsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i11.MyShipmentsPage();
        }),
    AboutUsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i12.AboutUsPage();
        }),
    FrequentQuestionsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i13.FrequentQuestionsPage();
        }),
    ProfilePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i14.ProfilePage();
        }),
    SettingsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i15.SettingsPage();
        }),
    ServicesFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i16.ServicesFgrPage();
        }),
    InfoFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i17.InfoFgrPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: 'civix', fullMatch: true),
        _i1.RouteConfig(MainCivixPageRoute.name, path: 'civix', children: [
          _i1.RouteConfig('#redirect',
              path: '', redirectTo: 'instituciones', fullMatch: true),
          _i1.RouteConfig(InstitutionsListPageRoute.name,
              path: 'instituciones'),
          _i1.RouteConfig(QuickAccessPageRoute.name, path: 'acceso-rapido'),
          _i1.RouteConfig(MyShipmentsPageRoute.name, path: 'mis-envios'),
          _i1.RouteConfig(AboutUsPageRoute.name, path: 'acerca-de'),
          _i1.RouteConfig(FrequentQuestionsPageRoute.name,
              path: 'preguntas-frequentes'),
          _i1.RouteConfig(ProfilePageRoute.name, path: 'perfil'),
          _i1.RouteConfig(SettingsPageRoute.name, path: 'ajustes')
        ]),
        _i1.RouteConfig(MainFgrPageRoute.name, path: 'fgr', children: [
          _i1.RouteConfig('#redirect',
              path: '', redirectTo: 'servicios-fgr', fullMatch: true),
          _i1.RouteConfig(ServicesFgrPageRoute.name, path: 'servicios-fgr'),
          _i1.RouteConfig(InfoFgrPageRoute.name, path: 'info-fgr')
        ]),
        _i1.RouteConfig(WriteStatementFgrPageRoute.name,
            path: 'redactar-planteamiento-fgr'),
        _i1.RouteConfig(ListStatementFgrPageRoute.name,
            path: 'planteamientos-fgr'),
        _i1.RouteConfig(ShowStatementFgrPageRoute.name,
            path: 'planteamiento-fgr'),
        _i1.RouteConfig(ConsultStateFgrPageRoute.name,
            path: 'consultar-estado-fgr')
      ];
}

class MainCivixPageRoute extends _i1.PageRouteInfo {
  const MainCivixPageRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'civix', initialChildren: children);

  static const String name = 'MainCivixPageRoute';
}

class MainFgrPageRoute extends _i1.PageRouteInfo {
  const MainFgrPageRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'fgr', initialChildren: children);

  static const String name = 'MainFgrPageRoute';
}

class WriteStatementFgrPageRoute
    extends _i1.PageRouteInfo<WriteStatementFgrPageRouteArgs> {
  WriteStatementFgrPageRoute({required _i18.WriteStatementFgrCubit bloc})
      : super(name,
            path: 'redactar-planteamiento-fgr',
            args: WriteStatementFgrPageRouteArgs(bloc: bloc));

  static const String name = 'WriteStatementFgrPageRoute';
}

class WriteStatementFgrPageRouteArgs {
  const WriteStatementFgrPageRouteArgs({required this.bloc});

  final _i18.WriteStatementFgrCubit bloc;
}

class ListStatementFgrPageRoute
    extends _i1.PageRouteInfo<ListStatementFgrPageRouteArgs> {
  ListStatementFgrPageRoute({required _i19.ListStatementFgrCubit bloc})
      : super(name,
            path: 'planteamientos-fgr',
            args: ListStatementFgrPageRouteArgs(bloc: bloc));

  static const String name = 'ListStatementFgrPageRoute';
}

class ListStatementFgrPageRouteArgs {
  const ListStatementFgrPageRouteArgs({required this.bloc});

  final _i19.ListStatementFgrCubit bloc;
}

class ShowStatementFgrPageRoute
    extends _i1.PageRouteInfo<ShowStatementFgrPageRouteArgs> {
  ShowStatementFgrPageRoute({required String id})
      : super(name,
            path: 'planteamiento-fgr',
            args: ShowStatementFgrPageRouteArgs(id: id));

  static const String name = 'ShowStatementFgrPageRoute';
}

class ShowStatementFgrPageRouteArgs {
  const ShowStatementFgrPageRouteArgs({required this.id});

  final String id;
}

class ConsultStateFgrPageRoute
    extends _i1.PageRouteInfo<ConsultStateFgrPageRouteArgs> {
  ConsultStateFgrPageRoute({required _i20.ConsultStateFgrCubit bloc})
      : super(name,
            path: 'consultar-estado-fgr',
            args: ConsultStateFgrPageRouteArgs(bloc: bloc));

  static const String name = 'ConsultStateFgrPageRoute';
}

class ConsultStateFgrPageRouteArgs {
  const ConsultStateFgrPageRouteArgs({required this.bloc});

  final _i20.ConsultStateFgrCubit bloc;
}

class InstitutionsListPageRoute extends _i1.PageRouteInfo {
  const InstitutionsListPageRoute() : super(name, path: 'instituciones');

  static const String name = 'InstitutionsListPageRoute';
}

class QuickAccessPageRoute extends _i1.PageRouteInfo {
  const QuickAccessPageRoute() : super(name, path: 'acceso-rapido');

  static const String name = 'QuickAccessPageRoute';
}

class MyShipmentsPageRoute extends _i1.PageRouteInfo {
  const MyShipmentsPageRoute() : super(name, path: 'mis-envios');

  static const String name = 'MyShipmentsPageRoute';
}

class AboutUsPageRoute extends _i1.PageRouteInfo {
  const AboutUsPageRoute() : super(name, path: 'acerca-de');

  static const String name = 'AboutUsPageRoute';
}

class FrequentQuestionsPageRoute extends _i1.PageRouteInfo {
  const FrequentQuestionsPageRoute()
      : super(name, path: 'preguntas-frequentes');

  static const String name = 'FrequentQuestionsPageRoute';
}

class ProfilePageRoute extends _i1.PageRouteInfo {
  const ProfilePageRoute() : super(name, path: 'perfil');

  static const String name = 'ProfilePageRoute';
}

class SettingsPageRoute extends _i1.PageRouteInfo {
  const SettingsPageRoute() : super(name, path: 'ajustes');

  static const String name = 'SettingsPageRoute';
}

class ServicesFgrPageRoute extends _i1.PageRouteInfo {
  const ServicesFgrPageRoute() : super(name, path: 'servicios-fgr');

  static const String name = 'ServicesFgrPageRoute';
}

class InfoFgrPageRoute extends _i1.PageRouteInfo {
  const InfoFgrPageRoute() : super(name, path: 'info-fgr');

  static const String name = 'InfoFgrPageRoute';
}
