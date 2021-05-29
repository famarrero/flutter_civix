import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Android/Flutter/Proyectos/flutter_civix/lib/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: MainFGR(),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // Built-in localization for text direction LTR/RTL
          // GlobalWidgetsLocalizations.delegate,
        ],
        locale: Locale('es', 'Es'),
      ),
    );
  }
}


