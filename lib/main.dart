import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
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
    return DevicePreview(
        enabled: false,
        builder: (context) => OKToast(
              child: MaterialApp.router(
                routeInformationParser: _appRouter.defaultRouteParser(),
                routerDelegate: _appRouter.delegate(),
                title: 'Flutter Civix Demo',
                theme: ThemeData(
                  // primaryColor: Color(0xff0c4d93),
                  // accentColor: Color(0xff041a2d),
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
            ));
  }
}
