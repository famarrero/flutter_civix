import 'dart:convert';
import 'dart:io';

import 'package:flutter_civix/src/data/data_sources/local_data/local_database/daos/statement_fgr_dao.dart';
import 'package:flutter_civix/src/data/data_sources/local_data/local_database/moor_database.dart';
import 'package:flutter_civix/src/domain/entities/fgr/promoter_fgr.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';
import 'package:flutter_civix/src/domain/repositories/database_fgr_repository.dart';

class DataBaseFGRRepositoryImpl implements DataBaseFGRRepository {
  final StatementFGRDao _statementFGRDao;

  DataBaseFGRRepositoryImpl(this._statementFGRDao);

  @override
  Future<List<StatementFGR>> getAllStatementsFGR() async {
    List<StatementFGREntity> sfe = await _statementFGRDao.getAllStatementsFGR;
    return sfe.map<StatementFGR>((sfe) => _convertFromDataBase(sfe)).toList();
  }

  @override
  Stream<List<StatementFGR>> watchAllStatementsFGR() {
    Stream<List<StatementFGREntity>> sfe = _statementFGRDao.watchAllStatementsFGR;
    Stream<List<StatementFGR>> sf = sfe.map<List<StatementFGR>>(
        (event) => event.map<StatementFGR>((e) => _convertFromDataBase(e)).toList());
    return sf;
  }

  @override
  Future<StatementFGR?> getStatementFGRById(String tiked) async {
    StatementFGREntity? sfe = await _statementFGRDao.getStatementFGRById(tiked);

    if (sfe != null)
      return _convertFromDataBase(sfe);
    else
      return null;
  }

  @override
  Stream<StatementFGR?> watchStatementFGRById(String tiked) {
    Stream<StatementFGREntity?> sfe = _statementFGRDao.watchStatementFGRById(tiked);
    return sfe.map<StatementFGR?>((sfe) => (sfe != null) ? _convertFromDataBase(sfe) : null);
  }

  @override
  Future<int> insertStatementFGR(StatementFGR statementFGR) async {
    return await _statementFGRDao.insertStatementFGR(_convertToDataBase(statementFGR));
  }

  @override
  Future<void> insertStatementsFGR(List<StatementFGR> statementFGR) async {
    List<StatementFGREntity> sfe =
        statementFGR.map<StatementFGREntity>((e) => _convertToDataBase(e)).toList();
    await _statementFGRDao.insertStatementsFGR(sfe);
  }

  @override
  Future updateStatementFGR(StatementFGR statementFGR) async {
    return _statementFGRDao.updateStatementFGR(_convertToDataBase(statementFGR));
  }

  @override
  Future deleteStatementFGR(StatementFGR statementFGR) async {
    return _statementFGRDao.deleteStatementFGR(_convertToDataBase(statementFGR));
  }

  StatementFGREntity _convertToDataBase(StatementFGR sf) {
    List<String>? promoters = sf.promoters!.map<String>((promoter) => promoter.toJson()).toList();
    List<String>? files = sf.files!.map<String>((file) => file.path).toList();

    return StatementFGREntity(
        tiked: sf.tiked!,
        subject: sf.subject!,
        statement: sf.statement!,
        promoters: jsonEncode(promoters),
        files: jsonEncode(files),
        dateSend: null);
  }

  StatementFGR _convertFromDataBase(StatementFGREntity sf) {
    List<PromoterFRG>? promoters = jsonDecode(sf.promoters!)
        .map<PromoterFRG>((promoter) => PromoterFRG.fromJson(promoter))
        .toList();
    List<File>? files = jsonDecode(sf.files!).map<File>((file) => File(file)).toList();

    return StatementFGR(
        tiked: sf.tiked,
        subject: sf.subject,
        statement: sf.statement,
        promoters: promoters,
        files: files,
        dateSend: null);
  }
}
