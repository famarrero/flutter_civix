import 'dart:convert';

class StatementResponseConsult {
  final String? tiked;
  final String? state;
  final String? response;

  StatementResponseConsult({required this.tiked, required this.state, required this.response});

  StatementResponseConsult copyWith({
    String? ticked,
    String? state,
    String? response,
  }) {
    return StatementResponseConsult(
      tiked: ticked ?? this.tiked,
      state: state ?? this.state,
      response: response ?? this.response,
    );
  }

  String toJson() {
    return jsonEncode(this.toMap());
  }

  static StatementResponseConsult fromJson(String jsonString) {
    return StatementResponseConsult.fromMap(jsonDecode(jsonString));
  }

  factory StatementResponseConsult.fromMap(Map<String, dynamic> map) {
    return new StatementResponseConsult(
        tiked: map['tiked'] as String?,
        state: map['state'] as String?,
        response: map['response'] as String?);
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'tiked': this.tiked,
      'state': this.state,
      'response': this.response,
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'StatementFRG{tiked: $tiked, state: $state, response: $response}';
  }
}
