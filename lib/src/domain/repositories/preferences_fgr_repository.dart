import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';

abstract class PreferencesFGRRepository {
  Future<void> savedStatementFGR(StatementFGR statementFRG);

  Future<StatementFGR?> getSavedStatementFGR();

  Future<void> deleteStatmentFGR();
}
