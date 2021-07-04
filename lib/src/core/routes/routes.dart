import 'package:auto_route/annotations.dart';
import 'package:flutter_civix/src/presentation/pages/civix/about_us/about_us_page.dart';
import 'package:flutter_civix/src/presentation/pages/civix/main_civix/main_civix_page.dart';
import 'package:flutter_civix/src/presentation/pages/civix/my_shipments/my_shipments_page.dart';
import 'package:flutter_civix/src/presentation/pages/civix/profile/profile_page.dart';
import 'package:flutter_civix/src/presentation/pages/civix/quick_access/quick_access_page.dart';
import 'package:flutter_civix/src/presentation/pages/civix/settings/settings_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/consult_state_fgr/consult_state_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/list_statement_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/general/contact_us/contact_us_page.dart';
import 'package:flutter_civix/src/presentation/pages/general/entities_by_province/entities_by_province_page.dart';
import 'package:flutter_civix/src/presentation/pages/general/frequent_questions/frequent_questions_page.dart';
import 'package:flutter_civix/src/presentation/pages/general/informative_texts/informative_texts_page.dart';
import 'package:flutter_civix/src/presentation/pages/tsp/main_tsp/main_tsp_page.dart';
import 'package:flutter_civix/src/presentation/pages/tsp/services_fgr/services_fgr_page.dart';
import '../../presentation/pages/fgr/main_fgr/main_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/services_fgr/services_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/show_statement_fgr/show_statement_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/write_statement_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/civix/institutions_list/institutions_list_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    ///Civix
    AutoRoute<dynamic>(
        page: MainCivixPage,
        initial: true,
        path: 'civix',
        children: [
          AutoRoute<dynamic>(
              initial: true, page: InstitutionsListPage, path: 'instituciones'),
          AutoRoute<dynamic>(page: QuickAccessPage, path: 'acceso-rapido'),
          AutoRoute<dynamic>(page: MyShipmentsPage, path: 'mis-envios'),
          AutoRoute<dynamic>(page: AboutUsPage, path: 'acerca-de'),
          AutoRoute<dynamic>(page: ProfilePage, path: 'perfil'),
          AutoRoute<dynamic>(page: SettingsPage, path: 'ajustes'),
        ]),

    ///Generals
    AutoRoute<dynamic>(
        page: FrequentQuestionsPage, path: 'preguntas-frequentes'),
    AutoRoute<dynamic>(page: InformativeTextsPage, path: 'informacion'),
    AutoRoute<dynamic>(page: EntitiesByProvincePage, path: 'entidades'),
    AutoRoute<dynamic>(page: ContactUsPage, path: 'contactenos'),

    ///Fgr
    AutoRoute<dynamic>(page: MainFgrPage, path: 'fgr', children: [
      AutoRoute<dynamic>(
          initial: true, page: ServicesFgrPage, path: 'servicios-fgr'),
    ]),
    AutoRoute<dynamic>(
        page: WriteStatementFgrPage, path: 'redactar-planteamiento-fgr'),
    AutoRoute<dynamic>(page: ListStatementFgrPage, path: 'planteamientos-fgr'),
    AutoRoute<dynamic>(page: ShowStatementFgrPage, path: 'planteamiento-fgr'),
    AutoRoute<dynamic>(page: ConsultStateFgrPage, path: 'consultar-estado-fgr'),

    ///Tsp
    AutoRoute<dynamic>(page: MainTspPage, path: 'tsp', children: [
      AutoRoute<dynamic>(
          initial: true, page: ServicesTspPage, path: 'servicios-tsp'),
    ])
  ],
)
class $AppRouter {}

//run this when modify this file
// flutter packages pub run build_runner build
