// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class StatementFGREntity extends DataClass
    implements Insertable<StatementFGREntity> {
  final String tiked;
  final String subject;
  final String statement;
  final String? promoters;
  final String? files;
  final DateTime? dateSend;
  StatementFGREntity(
      {required this.tiked,
      required this.subject,
      required this.statement,
      this.promoters,
      this.files,
      this.dateSend});
  factory StatementFGREntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return StatementFGREntity(
      tiked:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}tiked'])!,
      subject: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}subject'])!,
      statement: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}statement'])!,
      promoters: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}promoters']),
      files:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}files']),
      dateSend: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_send']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tiked'] = Variable<String>(tiked);
    map['subject'] = Variable<String>(subject);
    map['statement'] = Variable<String>(statement);
    if (!nullToAbsent || promoters != null) {
      map['promoters'] = Variable<String?>(promoters);
    }
    if (!nullToAbsent || files != null) {
      map['files'] = Variable<String?>(files);
    }
    if (!nullToAbsent || dateSend != null) {
      map['date_send'] = Variable<DateTime?>(dateSend);
    }
    return map;
  }

  StatementsFGRCompanion toCompanion(bool nullToAbsent) {
    return StatementsFGRCompanion(
      tiked: Value(tiked),
      subject: Value(subject),
      statement: Value(statement),
      promoters: promoters == null && nullToAbsent
          ? const Value.absent()
          : Value(promoters),
      files:
          files == null && nullToAbsent ? const Value.absent() : Value(files),
      dateSend: dateSend == null && nullToAbsent
          ? const Value.absent()
          : Value(dateSend),
    );
  }

  factory StatementFGREntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return StatementFGREntity(
      tiked: serializer.fromJson<String>(json['tiked']),
      subject: serializer.fromJson<String>(json['subject']),
      statement: serializer.fromJson<String>(json['statement']),
      promoters: serializer.fromJson<String?>(json['promoters']),
      files: serializer.fromJson<String?>(json['files']),
      dateSend: serializer.fromJson<DateTime?>(json['dateSend']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tiked': serializer.toJson<String>(tiked),
      'subject': serializer.toJson<String>(subject),
      'statement': serializer.toJson<String>(statement),
      'promoters': serializer.toJson<String?>(promoters),
      'files': serializer.toJson<String?>(files),
      'dateSend': serializer.toJson<DateTime?>(dateSend),
    };
  }

  StatementFGREntity copyWith(
          {String? tiked,
          String? subject,
          String? statement,
          String? promoters,
          String? files,
          DateTime? dateSend}) =>
      StatementFGREntity(
        tiked: tiked ?? this.tiked,
        subject: subject ?? this.subject,
        statement: statement ?? this.statement,
        promoters: promoters ?? this.promoters,
        files: files ?? this.files,
        dateSend: dateSend ?? this.dateSend,
      );
  @override
  String toString() {
    return (StringBuffer('StatementFGREntity(')
          ..write('tiked: $tiked, ')
          ..write('subject: $subject, ')
          ..write('statement: $statement, ')
          ..write('promoters: $promoters, ')
          ..write('files: $files, ')
          ..write('dateSend: $dateSend')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      tiked.hashCode,
      $mrjc(
          subject.hashCode,
          $mrjc(
              statement.hashCode,
              $mrjc(promoters.hashCode,
                  $mrjc(files.hashCode, dateSend.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is StatementFGREntity &&
          other.tiked == this.tiked &&
          other.subject == this.subject &&
          other.statement == this.statement &&
          other.promoters == this.promoters &&
          other.files == this.files &&
          other.dateSend == this.dateSend);
}

class StatementsFGRCompanion extends UpdateCompanion<StatementFGREntity> {
  final Value<String> tiked;
  final Value<String> subject;
  final Value<String> statement;
  final Value<String?> promoters;
  final Value<String?> files;
  final Value<DateTime?> dateSend;
  const StatementsFGRCompanion({
    this.tiked = const Value.absent(),
    this.subject = const Value.absent(),
    this.statement = const Value.absent(),
    this.promoters = const Value.absent(),
    this.files = const Value.absent(),
    this.dateSend = const Value.absent(),
  });
  StatementsFGRCompanion.insert({
    required String tiked,
    required String subject,
    required String statement,
    this.promoters = const Value.absent(),
    this.files = const Value.absent(),
    this.dateSend = const Value.absent(),
  })  : tiked = Value(tiked),
        subject = Value(subject),
        statement = Value(statement);
  static Insertable<StatementFGREntity> custom({
    Expression<String>? tiked,
    Expression<String>? subject,
    Expression<String>? statement,
    Expression<String?>? promoters,
    Expression<String?>? files,
    Expression<DateTime?>? dateSend,
  }) {
    return RawValuesInsertable({
      if (tiked != null) 'tiked': tiked,
      if (subject != null) 'subject': subject,
      if (statement != null) 'statement': statement,
      if (promoters != null) 'promoters': promoters,
      if (files != null) 'files': files,
      if (dateSend != null) 'date_send': dateSend,
    });
  }

  StatementsFGRCompanion copyWith(
      {Value<String>? tiked,
      Value<String>? subject,
      Value<String>? statement,
      Value<String?>? promoters,
      Value<String?>? files,
      Value<DateTime?>? dateSend}) {
    return StatementsFGRCompanion(
      tiked: tiked ?? this.tiked,
      subject: subject ?? this.subject,
      statement: statement ?? this.statement,
      promoters: promoters ?? this.promoters,
      files: files ?? this.files,
      dateSend: dateSend ?? this.dateSend,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tiked.present) {
      map['tiked'] = Variable<String>(tiked.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (statement.present) {
      map['statement'] = Variable<String>(statement.value);
    }
    if (promoters.present) {
      map['promoters'] = Variable<String?>(promoters.value);
    }
    if (files.present) {
      map['files'] = Variable<String?>(files.value);
    }
    if (dateSend.present) {
      map['date_send'] = Variable<DateTime?>(dateSend.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatementsFGRCompanion(')
          ..write('tiked: $tiked, ')
          ..write('subject: $subject, ')
          ..write('statement: $statement, ')
          ..write('promoters: $promoters, ')
          ..write('files: $files, ')
          ..write('dateSend: $dateSend')
          ..write(')'))
        .toString();
  }
}

class $StatementsFGRTable extends StatementsFGR
    with TableInfo<$StatementsFGRTable, StatementFGREntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $StatementsFGRTable(this._db, [this._alias]);
  final VerificationMeta _tikedMeta = const VerificationMeta('tiked');
  @override
  late final GeneratedTextColumn tiked = _constructTiked();
  GeneratedTextColumn _constructTiked() {
    return GeneratedTextColumn(
      'tiked',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subjectMeta = const VerificationMeta('subject');
  @override
  late final GeneratedTextColumn subject = _constructSubject();
  GeneratedTextColumn _constructSubject() {
    return GeneratedTextColumn(
      'subject',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statementMeta = const VerificationMeta('statement');
  @override
  late final GeneratedTextColumn statement = _constructStatement();
  GeneratedTextColumn _constructStatement() {
    return GeneratedTextColumn(
      'statement',
      $tableName,
      false,
    );
  }

  final VerificationMeta _promotersMeta = const VerificationMeta('promoters');
  @override
  late final GeneratedTextColumn promoters = _constructPromoters();
  GeneratedTextColumn _constructPromoters() {
    return GeneratedTextColumn(
      'promoters',
      $tableName,
      true,
    );
  }

  final VerificationMeta _filesMeta = const VerificationMeta('files');
  @override
  late final GeneratedTextColumn files = _constructFiles();
  GeneratedTextColumn _constructFiles() {
    return GeneratedTextColumn(
      'files',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateSendMeta = const VerificationMeta('dateSend');
  @override
  late final GeneratedDateTimeColumn dateSend = _constructDateSend();
  GeneratedDateTimeColumn _constructDateSend() {
    return GeneratedDateTimeColumn('date_send', $tableName, true,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [tiked, subject, statement, promoters, files, dateSend];
  @override
  $StatementsFGRTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'statements_f_g_r';
  @override
  final String actualTableName = 'statements_f_g_r';
  @override
  VerificationContext validateIntegrity(Insertable<StatementFGREntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tiked')) {
      context.handle(
          _tikedMeta, tiked.isAcceptableOrUnknown(data['tiked']!, _tikedMeta));
    } else if (isInserting) {
      context.missing(_tikedMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('statement')) {
      context.handle(_statementMeta,
          statement.isAcceptableOrUnknown(data['statement']!, _statementMeta));
    } else if (isInserting) {
      context.missing(_statementMeta);
    }
    if (data.containsKey('promoters')) {
      context.handle(_promotersMeta,
          promoters.isAcceptableOrUnknown(data['promoters']!, _promotersMeta));
    }
    if (data.containsKey('files')) {
      context.handle(
          _filesMeta, files.isAcceptableOrUnknown(data['files']!, _filesMeta));
    }
    if (data.containsKey('date_send')) {
      context.handle(_dateSendMeta,
          dateSend.isAcceptableOrUnknown(data['date_send']!, _dateSendMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tiked};
  @override
  StatementFGREntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return StatementFGREntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StatementsFGRTable createAlias(String alias) {
    return $StatementsFGRTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $StatementsFGRTable statementsFGR = $StatementsFGRTable(this);
  late final StatementFGRDao statementFGRDao =
      StatementFGRDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [statementsFGR];
}
