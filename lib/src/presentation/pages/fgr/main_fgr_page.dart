import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';

class MainFGRPage extends StatefulWidget {
  MainFGRPage();

  @override
  _MainFGRPageState createState() => _MainFGRPageState();
}

class _MainFGRPageState extends State<MainFGRPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => injector<WriteStatementFgrCubit>(),
        child: _ScaffoldMainFGRPage());
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
                AutoRouter.of(context)
                    .push(WriteStatementFgrPageRoute(bloc: bloc));
              },
            )
          ],
        ),
      ),
    );
  }
}
