// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../presentation/pages/civix/about_us/about_us_page.dart' as _i19;
import '../../presentation/pages/civix/institutions_list/institutions_list_page.dart'
    as _i16;
import '../../presentation/pages/civix/main_civix/main_civix_page.dart' as _i3;
import '../../presentation/pages/civix/my_shipments/my_shipments_page.dart'
    as _i18;
import '../../presentation/pages/civix/profile/profile_page.dart' as _i20;
import '../../presentation/pages/civix/quick_access/quick_access_page.dart'
    as _i17;
import '../../presentation/pages/civix/settings/settings_page.dart' as _i21;
import '../../presentation/pages/fgr/consult_state_fgr/consult_state_fgr_page.dart'
    as _i13;
import '../../presentation/pages/fgr/consult_state_fgr/cubit/consult_state_fgr_cubit.dart'
    as _i27;
import '../../presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart'
    as _i26;
import '../../presentation/pages/fgr/list_statement_fgr/list_statement_fgr_page.dart'
    as _i11;
import '../../presentation/pages/fgr/main_fgr/main_fgr_page.dart' as _i9;
import '../../presentation/pages/fgr/services_fgr/services_fgr_page.dart'
    as _i22;
import '../../presentation/pages/fgr/show_statement_fgr/show_statement_fgr_page.dart'
    as _i12;
import '../../presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart'
    as _i25;
import '../../presentation/pages/fgr/write_statement_fgr/write_statement_fgr_page.dart'
    as _i10;
import '../../presentation/pages/general/contact_us/contact_us_page.dart'
    as _i8;
import '../../presentation/pages/general/entities_by_province/entities_by_province_page.dart'
    as _i6;
import '../../presentation/pages/general/entities_list/entities_list_page.dart'
    as _i7;
import '../../presentation/pages/general/frequent_questions/frequent_questions_page.dart'
    as _i4;
import '../../presentation/pages/general/informative_texts/informative_texts_page.dart'
    as _i5;
import '../../presentation/pages/onbc/main_onbc/main_onbc_page.dart' as _i15;
import '../../presentation/pages/onbc/services_onbc/services_onbc_page.dart'
    as _i24;
import '../../presentation/pages/tsp/main_tsp/main_tsp_page.dart' as _i14;
import '../../presentation/pages/tsp/services_tsp/services_tsp_page.dart'
    as _i23;

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
    FrequentQuestionsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<FrequentQuestionsPageRouteArgs>();
          return _i4.FrequentQuestionsPage(
              key: args.key,
              primaryColor: args.primaryColor,
              secondaryColor: args.secondaryColor,
              primarySwatch: args.primarySwatch,
              jsonFaq: args.jsonFaq,
              subtitle: args.subtitle);
        }),
    InformativeTextsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<InformativeTextsPageRouteArgs>();
          return _i5.InformativeTextsPage(
              key: args.key,
              primaryColor: args.primaryColor,
              secondaryColor: args.secondaryColor,
              primarySwatch: args.primarySwatch,
              jsonInformativeText: args.jsonInformativeText,
              subtitle: args.subtitle,
              iconHeader: args.iconHeader);
        }),
    EntitiesByProvincePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EntitiesByProvincePageRouteArgs>();
          return _i6.EntitiesByProvincePage(
              key: args.key,
              primaryColor: args.primaryColor,
              secondaryColor: args.secondaryColor,
              primarySwatch: args.primarySwatch,
              entitiesByProvinceJson: args.entitiesByProvinceJson,
              title: args.title,
              subtitle: args.subtitle);
        }),
    EntitiesListPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EntitiesListPageRouteArgs>();
          return _i7.EntitiesListPage(
              key: args.key,
              primaryColor: args.primaryColor,
              secondaryColor: args.secondaryColor,
              primarySwatch: args.primarySwatch,
              entitiesByProvinceJson: args.entitiesByProvinceJson,
              title: args.title,
              subtitle: args.subtitle);
        }),
    ContactUsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ContactUsPageRouteArgs>();
          return _i8.ContactUsPage(
              key: args.key,
              primaryColor: args.primaryColor,
              secondaryColor: args.secondaryColor,
              primarySwatch: args.primarySwatch,
              jsonContactUs: args.jsonContactUs,
              subtitle: args.subtitle,
              imageHeader: args.imageHeader);
        }),
    MainFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.MainFgrPage();
        }),
    WriteStatementFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<WriteStatementFgrPageRouteArgs>();
          return _i10.WriteStatementFgrPage(bloc: args.bloc);
        }),
    ListStatementFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ListStatementFgrPageRouteArgs>();
          return _i11.ListStatementFgrPage(bloc: args.bloc);
        }),
    ShowStatementFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ShowStatementFgrPageRouteArgs>();
          return _i12.ShowStatementFgrPage(id: args.id);
        }),
    ConsultStateFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ConsultStateFgrPageRouteArgs>();
          return _i13.ConsultStateFgrPage(bloc: args.bloc);
        }),
    MainTspPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i14.MainTspPage();
        }),
    MainOnbcPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i15.MainOnbcPage();
        }),
    InstitutionsListPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i16.InstitutionsListPage();
        }),
    QuickAccessPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i17.QuickAccessPage();
        }),
    MyShipmentsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i18.MyShipmentsPage();
        }),
    AboutUsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i19.AboutUsPage();
        }),
    ProfilePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i20.ProfilePage();
        }),
    SettingsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i21.SettingsPage();
        }),
    ServicesFgrPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i22.ServicesFgrPage();
        }),
    ServicesTspPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i23.ServicesTspPage();
        }),
    ServicesOnbcPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i24.ServicesOnbcPage();
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
          _i1.RouteConfig(ProfilePageRoute.name, path: 'perfil'),
          _i1.RouteConfig(SettingsPageRoute.name, path: 'ajustes')
        ]),
        _i1.RouteConfig(FrequentQuestionsPageRoute.name,
            path: 'preguntas-frequentes'),
        _i1.RouteConfig(InformativeTextsPageRoute.name, path: 'informacion'),
        _i1.RouteConfig(EntitiesByProvincePageRoute.name, path: 'entidades'),
        _i1.RouteConfig(EntitiesListPageRoute.name, path: 'entidades'),
        _i1.RouteConfig(ContactUsPageRoute.name, path: 'contactenos'),
        _i1.RouteConfig(MainFgrPageRoute.name, path: 'fgr', children: [
          _i1.RouteConfig('#redirect',
              path: '', redirectTo: 'servicios-fgr', fullMatch: true),
          _i1.RouteConfig(ServicesFgrPageRoute.name, path: 'servicios-fgr')
        ]),
        _i1.RouteConfig(WriteStatementFgrPageRoute.name,
            path: 'redactar-planteamiento-fgr'),
        _i1.RouteConfig(ListStatementFgrPageRoute.name,
            path: 'planteamientos-fgr'),
        _i1.RouteConfig(ShowStatementFgrPageRoute.name,
            path: 'planteamiento-fgr'),
        _i1.RouteConfig(ConsultStateFgrPageRoute.name,
            path: 'consultar-estado-fgr'),
        _i1.RouteConfig(MainTspPageRoute.name, path: 'tsp', children: [
          _i1.RouteConfig('#redirect',
              path: '', redirectTo: 'servicios-tsp', fullMatch: true),
          _i1.RouteConfig(ServicesTspPageRoute.name, path: 'servicios-tsp')
        ]),
        _i1.RouteConfig(MainOnbcPageRoute.name, path: 'onbc', children: [
          _i1.RouteConfig('#redirect',
              path: '', redirectTo: 'servicios-onbc', fullMatch: true),
          _i1.RouteConfig(ServicesOnbcPageRoute.name, path: 'servicios-onbc')
        ])
      ];
}

class MainCivixPageRoute extends _i1.PageRouteInfo {
  const MainCivixPageRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'civix', initialChildren: children);

  static const String name = 'MainCivixPageRoute';
}

class FrequentQuestionsPageRoute
    extends _i1.PageRouteInfo<FrequentQuestionsPageRouteArgs> {
  FrequentQuestionsPageRoute(
      {_i2.Key? key,
      required _i2.Color primaryColor,
      required _i2.Color secondaryColor,
      required _i2.MaterialColor primarySwatch,
      required String jsonFaq,
      required String subtitle})
      : super(name,
            path: 'preguntas-frequentes',
            args: FrequentQuestionsPageRouteArgs(
                key: key,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                primarySwatch: primarySwatch,
                jsonFaq: jsonFaq,
                subtitle: subtitle));

  static const String name = 'FrequentQuestionsPageRoute';
}

class FrequentQuestionsPageRouteArgs {
  const FrequentQuestionsPageRouteArgs(
      {this.key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primarySwatch,
      required this.jsonFaq,
      required this.subtitle});

  final _i2.Key? key;

  final _i2.Color primaryColor;

  final _i2.Color secondaryColor;

  final _i2.MaterialColor primarySwatch;

  final String jsonFaq;

  final String subtitle;
}

class InformativeTextsPageRoute
    extends _i1.PageRouteInfo<InformativeTextsPageRouteArgs> {
  InformativeTextsPageRoute(
      {_i2.Key? key,
      required _i2.Color primaryColor,
      required _i2.Color secondaryColor,
      required _i2.MaterialColor primarySwatch,
      required String jsonInformativeText,
      required String subtitle,
      required _i2.IconData iconHeader})
      : super(name,
            path: 'informacion',
            args: InformativeTextsPageRouteArgs(
                key: key,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                primarySwatch: primarySwatch,
                jsonInformativeText: jsonInformativeText,
                subtitle: subtitle,
                iconHeader: iconHeader));

  static const String name = 'InformativeTextsPageRoute';
}

class InformativeTextsPageRouteArgs {
  const InformativeTextsPageRouteArgs(
      {this.key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primarySwatch,
      required this.jsonInformativeText,
      required this.subtitle,
      required this.iconHeader});

  final _i2.Key? key;

  final _i2.Color primaryColor;

  final _i2.Color secondaryColor;

  final _i2.MaterialColor primarySwatch;

  final String jsonInformativeText;

  final String subtitle;

  final _i2.IconData iconHeader;
}

class EntitiesByProvincePageRoute
    extends _i1.PageRouteInfo<EntitiesByProvincePageRouteArgs> {
  EntitiesByProvincePageRoute(
      {_i2.Key? key,
      required _i2.Color primaryColor,
      required _i2.Color secondaryColor,
      required _i2.MaterialColor primarySwatch,
      required String entitiesByProvinceJson,
      required String title,
      required String subtitle})
      : super(name,
            path: 'entidades',
            args: EntitiesByProvincePageRouteArgs(
                key: key,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                primarySwatch: primarySwatch,
                entitiesByProvinceJson: entitiesByProvinceJson,
                title: title,
                subtitle: subtitle));

  static const String name = 'EntitiesByProvincePageRoute';
}

class EntitiesByProvincePageRouteArgs {
  const EntitiesByProvincePageRouteArgs(
      {this.key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primarySwatch,
      required this.entitiesByProvinceJson,
      required this.title,
      required this.subtitle});

  final _i2.Key? key;

  final _i2.Color primaryColor;

  final _i2.Color secondaryColor;

  final _i2.MaterialColor primarySwatch;

  final String entitiesByProvinceJson;

  final String title;

  final String subtitle;
}

class EntitiesListPageRoute
    extends _i1.PageRouteInfo<EntitiesListPageRouteArgs> {
  EntitiesListPageRoute(
      {_i2.Key? key,
      required _i2.Color primaryColor,
      required _i2.Color secondaryColor,
      required _i2.MaterialColor primarySwatch,
      required String entitiesByProvinceJson,
      required String title,
      required String subtitle})
      : super(name,
            path: 'entidades',
            args: EntitiesListPageRouteArgs(
                key: key,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                primarySwatch: primarySwatch,
                entitiesByProvinceJson: entitiesByProvinceJson,
                title: title,
                subtitle: subtitle));

  static const String name = 'EntitiesListPageRoute';
}

class EntitiesListPageRouteArgs {
  const EntitiesListPageRouteArgs(
      {this.key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primarySwatch,
      required this.entitiesByProvinceJson,
      required this.title,
      required this.subtitle});

  final _i2.Key? key;

  final _i2.Color primaryColor;

  final _i2.Color secondaryColor;

  final _i2.MaterialColor primarySwatch;

  final String entitiesByProvinceJson;

  final String title;

  final String subtitle;
}

class ContactUsPageRoute extends _i1.PageRouteInfo<ContactUsPageRouteArgs> {
  ContactUsPageRoute(
      {_i2.Key? key,
      required _i2.Color primaryColor,
      required _i2.Color secondaryColor,
      required _i2.MaterialColor primarySwatch,
      required String jsonContactUs,
      required String subtitle,
      required String imageHeader})
      : super(name,
            path: 'contactenos',
            args: ContactUsPageRouteArgs(
                key: key,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                primarySwatch: primarySwatch,
                jsonContactUs: jsonContactUs,
                subtitle: subtitle,
                imageHeader: imageHeader));

  static const String name = 'ContactUsPageRoute';
}

class ContactUsPageRouteArgs {
  const ContactUsPageRouteArgs(
      {this.key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primarySwatch,
      required this.jsonContactUs,
      required this.subtitle,
      required this.imageHeader});

  final _i2.Key? key;

  final _i2.Color primaryColor;

  final _i2.Color secondaryColor;

  final _i2.MaterialColor primarySwatch;

  final String jsonContactUs;

  final String subtitle;

  final String imageHeader;
}

class MainFgrPageRoute extends _i1.PageRouteInfo {
  const MainFgrPageRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'fgr', initialChildren: children);

  static const String name = 'MainFgrPageRoute';
}

class WriteStatementFgrPageRoute
    extends _i1.PageRouteInfo<WriteStatementFgrPageRouteArgs> {
  WriteStatementFgrPageRoute({required _i25.WriteStatementFgrCubit bloc})
      : super(name,
            path: 'redactar-planteamiento-fgr',
            args: WriteStatementFgrPageRouteArgs(bloc: bloc));

  static const String name = 'WriteStatementFgrPageRoute';
}

class WriteStatementFgrPageRouteArgs {
  const WriteStatementFgrPageRouteArgs({required this.bloc});

  final _i25.WriteStatementFgrCubit bloc;
}

class ListStatementFgrPageRoute
    extends _i1.PageRouteInfo<ListStatementFgrPageRouteArgs> {
  ListStatementFgrPageRoute({required _i26.ListStatementFgrCubit bloc})
      : super(name,
            path: 'planteamientos-fgr',
            args: ListStatementFgrPageRouteArgs(bloc: bloc));

  static const String name = 'ListStatementFgrPageRoute';
}

class ListStatementFgrPageRouteArgs {
  const ListStatementFgrPageRouteArgs({required this.bloc});

  final _i26.ListStatementFgrCubit bloc;
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
  ConsultStateFgrPageRoute({required _i27.ConsultStateFgrCubit bloc})
      : super(name,
            path: 'consultar-estado-fgr',
            args: ConsultStateFgrPageRouteArgs(bloc: bloc));

  static const String name = 'ConsultStateFgrPageRoute';
}

class ConsultStateFgrPageRouteArgs {
  const ConsultStateFgrPageRouteArgs({required this.bloc});

  final _i27.ConsultStateFgrCubit bloc;
}

class MainTspPageRoute extends _i1.PageRouteInfo {
  const MainTspPageRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'tsp', initialChildren: children);

  static const String name = 'MainTspPageRoute';
}

class MainOnbcPageRoute extends _i1.PageRouteInfo {
  const MainOnbcPageRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'onbc', initialChildren: children);

  static const String name = 'MainOnbcPageRoute';
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

class ServicesTspPageRoute extends _i1.PageRouteInfo {
  const ServicesTspPageRoute() : super(name, path: 'servicios-tsp');

  static const String name = 'ServicesTspPageRoute';
}

class ServicesOnbcPageRoute extends _i1.PageRouteInfo {
  const ServicesOnbcPageRoute() : super(name, path: 'servicios-onbc');

  static const String name = 'ServicesOnbcPageRoute';
}
