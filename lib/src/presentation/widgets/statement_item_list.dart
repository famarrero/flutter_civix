import 'package:flutter/material.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';

class StatementItemList extends StatelessWidget {
  final StatementFGR statement;

  const StatementItemList({
    required this.statement,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(16),
      leading: Icon(Icons.edit),
      title: Text(statement.subject!),
      subtitle: Text(statement.statement!),
      trailing: Image(image: Assets.images.marcaAguaFgr),
      onTap: () {},
    );
  }
}
