import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/routes.gr.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';

class MainFGRPage extends StatefulWidget {

  MainFGRPage();

  @override
  _MainFGRPageState createState() => _MainFGRPageState();
}

class _MainFGRPageState extends State<MainFGRPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S().mainFGR),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Icon(Icons.edit),
              title: Text('Write statement to FGR'),
              trailing: Image(image: Assets.images.marcaAguaFgr),
              onTap: (){
                AutoRouter.of(context).push(WriteStatementFgrPageRoute());
              },
            )
          ],
        ),
      ),
    );
  }
}