import 'package:flutter_civix/src/data/data_sources/local_data/local_database/daos/statement_fgr_dao.dart';
import 'package:flutter_civix/src/data/data_sources/local_data/local_database/entities/statement_fgr.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

@UseMoor(
  tables: [StatementsFGR],
  daos: [StatementFGRDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.slqite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
