import 'package:auto_route/annotations.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/list_statment_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/main_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/write_statement_fgr_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute<dynamic>(
      page: MainFgrPage,
      initial: true,
    ),
    AutoRoute<dynamic>(page: WriteStatementFgrPage),
    AutoRoute<dynamic>(page: ListStatementFgrPage),
  ],
)
class $AppRouter {}

//run this when modify this file
// flutter packages pub run build_runner build
