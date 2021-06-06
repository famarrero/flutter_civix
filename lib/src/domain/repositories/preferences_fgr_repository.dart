import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';

abstract class PreferencesFGRRepository {
  Future<void> savedStatementFGR(StatementFRG statementFRG);

  Future<StatementFRG?> getSavedStatementFGR();

  Future<void> deleteStatmentFGR();
}
