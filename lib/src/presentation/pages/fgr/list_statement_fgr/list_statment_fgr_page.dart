import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/statement_item_list.dart';

class ListStatementFgrPage extends StatelessWidget {
  final ListStatementFgrCubit bloc;

  ListStatementFgrPage({required this.bloc});

  @override
  Widget build(BuildContext context) {
    bloc.whatchAllStatmentFgr();

    return Scaffold(appBar: _buildAppBar(context), body: _buildBody());
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).statements),
          SizedBox(height: 4),
          Text(S.of(context).fgr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
        ],
      ),
      actions: [
        IconButton(
          tooltip: S.of(context).saveEraser,
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
        IconButton(
          tooltip: S.of(context).saveEraser,
          icon: Icon(Icons.sync),
          onPressed: () {},
        ),
        IconButton(
          tooltip: S.of(context).saveEraser,
          icon: Icon(Icons.qr_code_scanner),
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
          return Container(
            child: _buildStreamList(state),
          );
        },
      ),
    );
  }

  StreamBuilder<List<StatementFGR>> _buildStreamList(ListStatementFgrState state) {
    return StreamBuilder(
      stream: state.statmentsFgr,
      builder: (context, AsyncSnapshot<List<StatementFGR>> snapshot) {
        final statements = snapshot.data ?? [];
        return ListView.builder(
            itemCount: statements.length,
            itemBuilder: (BuildContext context, int index) {
              return StatementItemList(statement: statements[index]);
            });
      },
    );
  }
}
