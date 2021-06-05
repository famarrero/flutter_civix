import 'dart:convert';
import 'dart:io';

import 'package:flutter_civix/src/domain/entities/fgr/promoter_fgr.dart';

class StatementFRG {
  final String? subject;
  final String? statement;
  final List<PromoterFRG>? promoters;
  final List<File>? files;

  StatementFRG({
    required this.subject,
    required this.statement,
    this.promoters,
    this.files,
  });

  String toJson() {
    return jsonEncode(this.toMap());
  }

  static StatementFRG fromJson(String jsonString) {
    return StatementFRG.fromMap(jsonDecode(jsonString));
  }

  factory StatementFRG.fromMap(Map<String, dynamic> map) {
    var promoters = map['promoters'].cast<String>() as List<String>;
    var files = map['files'].cast<String>() as List<String>;
    return new StatementFRG(
      subject: map['subject'] as String?,
      statement: map['statement'] as String?,
      // promoters: promoters.map<PromoterFRG>((promoter) => PromoterFRG.fromMap(jsonDecode(promoter))).toList() ,
      promoters: promoters.map<PromoterFRG>((promoter) => PromoterFRG.fromJson(promoter)).toList() ,
      files: files.map<File>((file) => File(file)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'subject': this.subject,
      'statement': this.statement,
      // 'promoters': this.promoters?.map<String>((promoter) => jsonEncode(promoter.toMap()) ).toList(),
      'promoters': this.promoters?.map<String>((promoter) => promoter.toJson() ).toList(),
      'files': this.files?.map<String>( (file) => file.path ).toList(),
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'StatementFRG{subject: $subject, statement: $statement, promoters: $promoters, files: $files}';
  }
}
