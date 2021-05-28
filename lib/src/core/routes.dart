import 'package:auto_route/annotations.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/main_fgr_page.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statment_fgr_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute<dynamic>(
      page: MainFGRPage,
      initial: true,
    ),
    AutoRoute<dynamic>(page: WriteStatmentFgrPage),
  ],
)
class $AppRouter {}

//run this when modify this file
// flutter packages pub run build_runner build
