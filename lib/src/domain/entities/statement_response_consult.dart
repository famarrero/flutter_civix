import 'dart:convert';

class StatementResponseConsult {
  final String? ticked;
  final String? state;
  final String? response;

  StatementResponseConsult({required this.ticked, required this.state, required this.response});

  StatementResponseConsult copyWith({
    String? ticked,
    String? state,
    String? response,
  }) {
    return StatementResponseConsult(
      ticked: ticked ?? this.ticked,
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
        ticked: map['tiked'] as String?,
        state: map['state'] as String?,
        response: map['response'] as String?);
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'tiked': this.ticked,
      'state': this.state,
      'response': this.response,
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'StatementFRG{tiked: $ticked, state: $state, response: $response}';
  }
}
