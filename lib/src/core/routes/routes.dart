import 'package:auto_route/annotations.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/consult_state_fgr/consult_state_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/list_statment_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/main_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/show_statement_fgr/show_statement_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/write_statement_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/instituions_list.dart';
import 'package:flutter_civix/src/presentation/pages/my_home_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute<dynamic>(
      page: MyHomePage,
      initial: true,
      children: [
          AutoRoute<dynamic>(initial: true, page: InstitutionsListPage),
      ]
    ),
    AutoRoute<dynamic>(page: MainFgrPage),
    AutoRoute<dynamic>(page: WriteStatementFgrPage),
    AutoRoute<dynamic>(page: ListStatementFgrPage),
    AutoRoute<dynamic>(page: ShowStatementFgrPage),
    AutoRoute<dynamic>(page: ConsultStateFgrPage),
  ],
)
class $AppRouter {}

//run this when modify this file
// flutter packages pub run build_runner build
