import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFGR {
  static const keySavedStatmentFGR = 'saved_statement_fgr';

  Future<void> savedStatementFGR(String string) async {
    final prefs = await SharedPreferences.getInstance();
    // Store a value
    await prefs.setString(keySavedStatmentFGR, string);
  }

  Future<String?> getSavedStatementFGR() async {
    final prefs = await SharedPreferences.getInstance();
    // Read a value
    return prefs.getString(keySavedStatmentFGR) ?? null;
  }

  Future<void> deleteStatmentFGR() async {
    final prefs = await SharedPreferences.getInstance();
    // Delete a value
    await prefs.remove(keySavedStatmentFGR);
  }
}
