import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';

abstract class DataBaseFGRRepository {
  Future<List<StatementFGR>> getAllStatementsFGR();

  Stream<List<StatementFGR>> watchAllStatementsFGR();

  Future<StatementFGR?> getStatementFGRById(String tiked);

  Stream<StatementFGR?> watchStatementFGRById(String tiked);

  Future<int> insertStatementFGR(StatementFGR statementFGR);

  Future<void> insertStatementsFGR(List<StatementFGR> statementFGR);

  Future updateStatementFGR(StatementFGR statementFGR);

  Future deleteStatementFGR(StatementFGR statementFGR);

  Future deleteAllStatementFGR();
}
