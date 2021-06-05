import 'package:flutter_civix/src/data/data_sources/local_data/shared_preferences/shared_preferences_fgr.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';
import 'package:flutter_civix/src/domain/repositories/preferences_fgr_repository.dart';

class PreferencesFGRRepositoryImpl implements PreferencesFGRRepository {
  final SharedPreferencesFGR _sharedPreferencesFGR;

  PreferencesFGRRepositoryImpl(this._sharedPreferencesFGR);

  @override
  Future<StatementFRG?> getSavedStatementFGR() async {
    String stringStatementFRG =
        await _sharedPreferencesFGR.getSavedStatementFGR();
    if (stringStatementFRG != '') {
      return StatementFRG.fromJson(stringStatementFRG);
    }
    return null;
  }

  @override
  Future<void> savedStatementFGR(StatementFRG statementFRG) async {
    String serializedStatement = statementFRG.toJson();
    print(serializedStatement);
    await _sharedPreferencesFGR.savedStatementFGR(serializedStatement);
  }
}
