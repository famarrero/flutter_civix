import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFGR {
  Future<void> savedStatementFGR(String string) async {
    final prefs = await SharedPreferences.getInstance();
    // Store a value
    await prefs.setString('saved_statement_fgr', string);
  }

  Future<String> getSavedStatementFGR() async {
    final prefs = await SharedPreferences.getInstance();
    // Read a value
    return prefs.getString('saved_statement_fgr') ?? '';
  }
}
