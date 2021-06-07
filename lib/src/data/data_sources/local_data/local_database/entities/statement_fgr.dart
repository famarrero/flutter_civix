import 'package:moor/moor.dart';

@DataClassName('StatementFGREntity')
class StatementsFGR extends Table {
  TextColumn get tiked => text()();

  TextColumn get subject => text()();

  TextColumn get statement => text()();

  TextColumn? get promoters => text().nullable()();

  TextColumn? get files => text().nullable()();

  DateTimeColumn? get dateSend => dateTime().withDefault(Constant(DateTime.now())).nullable()();

  @override
  Set<Column> get primaryKey => {tiked};
}
