import 'package:flutter_civix/src/data/data_sources/local_data/local_database/moor_database.dart';
import 'package:flutter_civix/src/data/data_sources/local_data/local_database/entities/statement_fgr.dart';
import 'package:moor/moor.dart';

// Moor works by source gen. This file will all the generated code.
part 'statement_fgr_dao.g.dart';

// Denote which tables this DAO can access
@UseDao(tables: [StatementsFGR])
class StatementFGRDao extends DatabaseAccessor<AppDatabase> with _$StatementFGRDaoMixin {
  final AppDatabase db;

  StatementFGRDao(this.db) : super(db);

  Future<List<StatementFGREntity>> get getAllStatementsFGR => select(statementsFGR).get();

  Stream<List<StatementFGREntity>> get watchAllStatementsFGR => select(statementsFGR).watch();

  Future<StatementFGREntity?> getStatementFGRById(String tiked) =>
      (select(statementsFGR)..where((tbl) => tbl.tiked.equals(tiked))).getSingleOrNull();

  Stream<StatementFGREntity?> watchStatementFGRById(String tiked) =>
      (select(statementsFGR)..where((tbl) => tbl.tiked.equals(tiked))).watchSingleOrNull();

  Future<int> insertStatementFGR(Insertable<StatementFGREntity> statementFGREntity) =>
      into(statementsFGR).insert(statementFGREntity, mode: InsertMode.insertOrReplace);

  Future<void> insertStatementsFGR(List<Insertable<StatementFGREntity>> chats) =>
      transaction(() async {
        for (final item in chats) {
          await insertStatementFGR(item);
        }
      });

  Future updateStatementFGR(Insertable<StatementFGREntity> statementFGREntity) =>
      update(statementsFGR).replace(statementFGREntity);

  Future deleteStatementFGR(Insertable<StatementFGREntity> statementFGREntity) =>
      delete(statementsFGR).delete(statementFGREntity);

  Future deleteAllStatementFGR() => delete(statementsFGR).go();
}
