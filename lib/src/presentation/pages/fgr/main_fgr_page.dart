import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';

class MainFgrPage extends StatefulWidget {
  MainFgrPage();

  @override
  _MainFgrPageState createState() => _MainFgrPageState();
}

class _MainFgrPageState extends State<MainFgrPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector<WriteStatementFgrCubit>()),
        BlocProvider(create: (context) => injector<ListStatementFgrCubit>()),
      ],
      child: _ScaffoldMainFGRPage(),
    );
  }
}

class _ScaffoldMainFGRPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mainFGR),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Icon(Icons.edit),
              title: Text('Write statement to FGR'),
              trailing: Image(image: Assets.images.marcaAguaFgr),
              onTap: () {
                var bloc = BlocProvider.of<WriteStatementFgrCubit>(context);
                AutoRouter.of(context).push(WriteStatementFgrPageRoute(bloc: bloc));
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Icon(Icons.list),
              title: Text('List of statements FGR'),
              trailing: Image(image: Assets.images.marcaAguaFgr),
              onTap: () {
                var bloc = BlocProvider.of<ListStatementFgrCubit>(context);
                AutoRouter.of(context).push(ListStatementFgrPageRoute(bloc: bloc));
              },
            )
          ],
        ),
      ),
    );
  }
}
