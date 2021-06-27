import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/statement_item_list_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListStatementFgrPage extends StatelessWidget {
  final ListStatementFgrCubit bloc;

  ListStatementFgrPage({required this.bloc});

  @override
  Widget build(BuildContext context) {
    bloc.watchAllStatementsFgr();

    return Theme(
        data: ThemeData(
            primaryColor: kFgrPrimaryColor,
            accentColor: kFgrSecondaryColor,
            primarySwatch: kFgrPrimaryMaterialColor),
        child: Scaffold(appBar: _buildAppBar(context), body: _buildBody()));
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).statements),
          SizedBox(height: 4),
          Text(S.of(context).fgr,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
        ],
      ),
      actions: [
        IconButton(
          tooltip: S.of(context).saveEraser,
          icon: Icon(Icons.notifications),
          onPressed: () => bloc.deleteAllStatementFGR(),
        ),
        IconButton(
          tooltip: S.of(context).saveEraser,
          icon: Icon(Icons.filter_list),
          onPressed: () {},
        ),
        IconButton(
          tooltip: S.of(context).saveEraser,
          icon: Icon(Icons.sync),
          onPressed: () {},
        ),
      ],
    );
  }

  _buildBody() {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<ListStatementFgrCubit, ListStatementFgrState>(
        builder: (context, state) {
          if (state.error != null) {
            return Container();
          } else {
            return Container(
              child: _buildStreamList(state.statmentsFgr),
            );
          }
        },
      ),
    );
  }

  StreamBuilder<List<StatementFGR>> _buildStreamList(
      Stream<List<StatementFGR>> statementsFgr) {
    return StreamBuilder(
      stream: statementsFgr,
      builder: (context, AsyncSnapshot<List<StatementFGR>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null && snapshot.data!.isNotEmpty) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  StatementFGR statement = snapshot.data![index];
                  return InkWell(
                    child: StatementItemListWidget(statement: statement, colorIcons: kFgrSecondaryColor,),
                    onTap: () {
                      AutoRouter.of(context).push(
                          ShowStatementFgrPageRoute(id: statement.ticked!));
                    },
                  );
                });
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.sadTear,
                      size: 50, color: Colors.black45),
                  SizedBox(height: 20),
                  Text('No hay ningún planteamiento',
                      style: TextStyle(fontSize: 16))
                ],
              ),
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
