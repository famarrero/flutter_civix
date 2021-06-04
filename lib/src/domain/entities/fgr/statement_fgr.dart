import 'dart:io';

import 'package:flutter_civix/src/domain/entities/fgr/promoter_fgr.dart';

class StatementFRG {
  final String subject;
  final String statement;
  final List<PromoterFRG>? promoters;
  final List<File>? files;

  StatementFRG({
    required this.subject,
    required this.statement,
    this.promoters,
    this.files,
  });

  @override
  String toString() {
    return 'StatementFRG{subject: $subject, statement: $statement, promoters: $promoters, files: $files}';
  }
}
