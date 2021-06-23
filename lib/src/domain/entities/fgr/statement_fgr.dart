import 'dart:convert';
import 'dart:io';

import 'package:flutter_civix/src/domain/entities/fgr/promoter_fgr.dart';

class StatementFGR {
  final String? ticked;
  final String? subject;
  final String? statement;
  final List<PromoterFRG>? promoters;
  final List<File>? files;
  final DateTime? dateSend;

  StatementFGR(
      {required this.ticked,
      required this.subject,
      required this.statement,
      this.promoters,
      this.files,
      this.dateSend});

  StatementFGR copyWith({
    String? ticked,
    String? subject,
    String? statement,
    List<PromoterFRG>? promoters,
    List<File>? files,
    DateTime? dateSend,
  }) {
    return StatementFGR(
      ticked: ticked ?? this.ticked,
      subject: subject ?? this.subject,
      statement: statement ?? this.statement,
      promoters: promoters ?? this.promoters,
      files: files ?? this.files,
      dateSend: dateSend ?? this.dateSend,
    );
  }

  String toJson() {
    return jsonEncode(this.toMap());
  }

  static StatementFGR fromJson(String jsonString) {
    return StatementFGR.fromMap(jsonDecode(jsonString));
  }

  factory StatementFGR.fromMap(Map<String, dynamic> map) {
    var promoters = map['promoters'].cast<String>() as List<String>;
    var files = map['files'].cast<String>() as List<String>;
    return new StatementFGR(
      ticked: map['tiked'] as String?,
      subject: map['subject'] as String?,
      statement: map['statement'] as String?,
      promoters: promoters.map<PromoterFRG>((promoter) => PromoterFRG.fromJson(promoter)).toList(),
      files: files.map<File>((file) => File(file)).toList(),
      dateSend: map['dateSend'] as DateTime?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'tiked': this.ticked,
      'subject': this.subject,
      'statement': this.statement,
      'promoters': this.promoters?.map<String>((promoter) => promoter.toJson()).toList(),
      'files': this.files?.map<String>((file) => file.path).toList(),
      'dateSend': this.dateSend,
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'StatementFRG{tiked: $ticked, subject: $subject, statement: $statement, promoters: $promoters, files: $files, sendDate: $dateSend}';
  }
}
