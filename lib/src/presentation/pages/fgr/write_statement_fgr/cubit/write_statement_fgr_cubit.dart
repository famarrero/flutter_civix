import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/services_manager/file_picker_manager.dart';
import 'package:flutter_civix/src/core/services_manager/image_picker_manager.dart';
import 'package:flutter_civix/src/core/utils/utils.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_civix/src/data/models/municipality_model.dart';
import 'package:flutter_civix/src/data/models/province_model.dart';
import 'package:flutter_civix/src/domain/entities/fgr/promoter_fgr.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';
import 'package:flutter_civix/src/domain/repositories/database_fgr_repository.dart';
import 'package:flutter_civix/src/domain/repositories/preferences_fgr_repository.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

part 'write_statement_fgr_state.dart';

class WriteStatementFgrCubit extends Cubit<WriteStatementFgrState> {
  final ImagePickerManager _imagePicker;
  final FilePickerManager _filePicker;
  final Directory _directory;
  final PreferencesFGRRepository _preferencesFGR;
  final DataBaseFGRRepository _dataBaseFGRRepository;

  WriteStatementFgrCubit(this._imagePicker, this._filePicker, this._directory, this._preferencesFGR,
      this._dataBaseFGRRepository)
      : super(WriteStatementFgrState.initial());

  final u = Utils();
  BuiltList<File> _files = BuiltList([]);
  BuiltList<PromoterFRG> _promoters = BuiltList([]);
  List<String> _documentsSupportedList = ['pdf', 'doc', 'xlsx', 'txt'];
  FormGroup _addStatementForm = FormsStatementFGR.addStatementForm;
  FormGroup _addEditPromoterForm = FormsStatementFGR.addPromoterForm;

  void _emitInitialsStates() {
    emit(state.copyWith(
        showMessage: '',
        stateSendStatement: SendStatementState.initial(),
        stateOfPromoters: PromoterListState(promoters: _promoters),
        stateOfFiles: FileListState.initial(pickedFiles: _files)));
  }

  FormGroup get getAddStatementForm => _addStatementForm;

  FormGroup getAddEditPromoterForm({required bool isEdit}) {
    if (isEdit) {
      //todo pass index later
      var promoter = _promoters[0];
      _addEditPromoterForm.value = {
        FormsStatementFGR.firstName: promoter.firstName,
        FormsStatementFGR.secondName: promoter.secondName,
        FormsStatementFGR.firstLastName: promoter.firstLastName,
        FormsStatementFGR.secondLastName: promoter.secondLastName,
        FormsStatementFGR.id: promoter.id,
        FormsStatementFGR.phone: promoter.phone,
        FormsStatementFGR.email: promoter.email,
        FormsStatementFGR.province: promoter.provinceModel,
        FormsStatementFGR.municipality: promoter.municipalityModel,
        FormsStatementFGR.address: promoter.address,
      };
    }
    return _addEditPromoterForm;
  }

  Future<void> savedStatement() async {
    _emitInitialsStates();

    var subject = _addStatementForm.control(FormsStatementFGR.subject).value as String?;
    var statement = _addStatementForm.control(FormsStatementFGR.statement).value as String?;
    var promoters = _promoters.toList();
    var files = _files.toList();
    if ((subject == null || subject.isEmpty) &&
        (statement == null || statement.isEmpty) &&
        promoters.isEmpty &&
        files.isEmpty) {
      emit(state.copyWith(
          showMessage: S.current.nothingToSave,
          stateOfPromoters: PromoterListState(promoters: _promoters),
          stateOfFiles: state.stateOfFiles.copyWith(pickedFiles: _files)));
      await _preferencesFGR.deleteStatmentFGR();
    } else {
      StatementFGR statementFGR = StatementFGR(
          tiked: null,
          subject: _addStatementForm.control(FormsStatementFGR.subject).value,
          statement: _addStatementForm.control(FormsStatementFGR.statement).value,
          promoters: _promoters.toList(),
          files: _files.toList());

      await _preferencesFGR.savedStatementFGR(statementFGR);

      emit(state.copyWith(
          showMessage: S.current.statementSaved,
          stateOfPromoters: PromoterListState(promoters: _promoters),
          stateOfFiles: state.stateOfFiles.copyWith(pickedFiles: _files)));
    }
  }

  Future<void> getSavedStatement() async {
    _emitInitialsStates();

    StatementFGR? savedStatement = await _preferencesFGR.getSavedStatementFGR();

    if (savedStatement != null) {
      _addStatementForm.control(FormsStatementFGR.subject).value = savedStatement.subject;
      _addStatementForm.control(FormsStatementFGR.statement).value = savedStatement.statement;

      if (savedStatement.promoters != null) _promoters = savedStatement.promoters!.toBuiltList();

      if (savedStatement.files != null)
        _files = await _checkIfFilesExists(savedStatement.files!.toBuiltList());

      emit(state.copyWith(
          showMessage: S.current.showingSadevStatement,
          stateOfPromoters: PromoterListState(promoters: _promoters),
          stateOfFiles: state.stateOfFiles.copyWith(pickedFiles: _files)));
    }

    _addStatementForm.markAsUntouched();
    _addEditPromoterForm.markAsUntouched();
  }

  Future<void> sendStatement() async {
    _emitInitialsStates();

    if (_addStatementForm.valid) {
      emit(state.copyWith(stateSendStatement: state.stateSendStatement.copyWith(isSending: true)));

      //Simulation of send statement
      await Future.delayed(Duration(seconds: 5));
      StatementFGR statementFGR = StatementFGR(
        tiked: Uuid().v4(),
        subject: _addStatementForm.control(FormsStatementFGR.subject).value,
        statement: _addStatementForm.control(FormsStatementFGR.statement).value,
        promoters: _promoters.toList(),
        files: _files.toList(),
      );

      _dataBaseFGRRepository.insertStatementFGR(statementFGR);

      emit(state.copyWith(
          stateSendStatement: state.stateSendStatement.copyWith(isSending: false, done: true)));
    } else {
      _addStatementForm.control(FormsStatementFGR.subject).markAsTouched();
      _addStatementForm.control(FormsStatementFGR.statement).markAsTouched();
    }
  }

  Future<void> getImageFormCameraOrGallery({required String source}) async {
    _emitInitialsStates();

    final String _newDirectory = '${_directory.path}/AppPictures';
    await Directory(_newDirectory).create(recursive: true);

    final Either<String, File> response;
    if (source == 'camera') {
      response = await _imagePicker.getImageFromCamera();
    } else {
      response = await _imagePicker.getImageFromGallery();
    }

    response.fold(
      (errorOrCancel) {
        emit(state.copyWith(stateOfFiles: state.stateOfFiles.copyWith(error: errorOrCancel)));
      },
      (file) async {
        emit(state.copyWith(
            stateOfFiles: FileListState(isLoading: true, pickedFiles: _files, done: false)));

        var nameFile = file.path.split('/').last.split('.').first;
        int quality = 75;
        /**
         * If size of image is more than 1 MB, compress image
         **/
        if (file.readAsBytesSync().lengthInBytes / 1024 / 1024 > 1) {
          quality = 50;
        }
        final imageCompressResponse =
            await u.compressImage(file, '$_newDirectory/$nameFile.webp', quality);
        imageCompressResponse.fold((error) {
          emit(state.copyWith(
              stateOfFiles: state.stateOfFiles.copyWith(isLoading: false, error: error)));
        }, (imageCompress) async {
          _files = (_files.toBuilder()..add(imageCompress)).build();

          file.delete(recursive: true);
        });

        emit(state.copyWith(
            stateOfFiles: FileListState(isLoading: false, pickedFiles: _files, done: true)));
      },
    );
  }

  Future<void> getDocument() async {
    _emitInitialsStates();

    //todo move file selected to new directory
    final String _newDirectory = '${_directory.path}/AppDocuments';
    await Directory(_newDirectory).create(recursive: true);

    final response = await _filePicker.getSingleFileByExtensions(_documentsSupportedList);

    response.fold(
      (errorOrCancel) {
        emit(state.copyWith(stateOfFiles: state.stateOfFiles.copyWith(error: errorOrCancel)));
      },
      (file) async {
        if (_documentsSupportedList.contains(file.path.split('.').last)) {
          emit(state.copyWith(
              stateOfFiles: FileListState(isLoading: true, pickedFiles: _files, done: false)));

          _files = (_files.toBuilder()..add(file)).build();

          emit(state.copyWith(
              stateOfFiles: FileListState(isLoading: false, pickedFiles: _files, done: true)));
        } else {
          emit(state.copyWith(
              stateOfFiles: state.stateOfFiles
                  .copyWith(isLoading: false, error: S.current.documentNotSupported)));
        }
      },
    );
  }

  Future<void> deleteFile(int index) async {
    await _files[index].delete(recursive: true);

    // var builder = _files.toBuilder();
    // builder.removeAt(index);
    // _files = builder.build();

    _files = (_files.toBuilder()..removeAt(index)).build();

    _emitInitialsStates();
  }

  Future<void> addPromoter(BuildContext context) async {
    if (_addEditPromoterForm.control(FormsStatementFGR.province).invalid) {
      _addEditPromoterForm.control(FormsStatementFGR.province).markAsTouched();
      _addEditPromoterForm.control(FormsStatementFGR.province).focus();
    } else if (_addEditPromoterForm.control(FormsStatementFGR.municipality).invalid) {
      _addEditPromoterForm.control(FormsStatementFGR.municipality).markAsTouched();
      _addEditPromoterForm.control(FormsStatementFGR.municipality).focus();
    } else {
      var provinceModel =
          _addEditPromoterForm.control(FormsStatementFGR.province).value as ProvinceModel;
      var municipalityModel =
          _addEditPromoterForm.control(FormsStatementFGR.municipality).value as MunicipalityModel;
      PromoterFRG promoterFRG = PromoterFRG(
          firstName: _addEditPromoterForm.control(FormsStatementFGR.firstName).value,
          secondName: _addEditPromoterForm.control(FormsStatementFGR.secondName).value,
          firstLastName: _addEditPromoterForm.control(FormsStatementFGR.firstLastName).value,
          secondLastName: _addEditPromoterForm.control(FormsStatementFGR.secondLastName).value,
          id: _addEditPromoterForm.control(FormsStatementFGR.id).value,
          email: _addEditPromoterForm.control(FormsStatementFGR.email).value,
          phone: _addEditPromoterForm.control(FormsStatementFGR.phone).value,
          provinceName: provinceModel.provinceName,
          provinceModel: provinceModel,
          municipalityName: municipalityModel.municipalityName,
          municipalityModel: municipalityModel,
          address: _addEditPromoterForm.control(FormsStatementFGR.address).value);
      _promoters = (_promoters.toBuilder()..add(promoterFRG)).build();

      _emitInitialsStates();

      //reset form
      _addEditPromoterForm.reset();

      Navigator.of(context).pop();
    }
  }

  Future<void> editPromoter(BuildContext context, int index) async {
    if (_addEditPromoterForm.control(FormsStatementFGR.province).invalid) {
      _addEditPromoterForm.control(FormsStatementFGR.province).markAsTouched();
      _addEditPromoterForm.control(FormsStatementFGR.province).focus();
    } else if (_addEditPromoterForm.control(FormsStatementFGR.municipality).invalid) {
      _addEditPromoterForm.control(FormsStatementFGR.municipality).markAsTouched();
      _addEditPromoterForm.control(FormsStatementFGR.municipality).focus();
    } else {
      var provinceModel =
          _addEditPromoterForm.control(FormsStatementFGR.province).value as ProvinceModel;
      var municipalityModel =
          _addEditPromoterForm.control(FormsStatementFGR.municipality).value as MunicipalityModel;
      PromoterFRG promoterFRG = PromoterFRG(
          firstName: _addEditPromoterForm.control(FormsStatementFGR.firstName).value,
          secondName: _addEditPromoterForm.control(FormsStatementFGR.secondName).value,
          firstLastName: _addEditPromoterForm.control(FormsStatementFGR.firstLastName).value,
          secondLastName: _addEditPromoterForm.control(FormsStatementFGR.secondLastName).value,
          id: _addEditPromoterForm.control(FormsStatementFGR.id).value,
          email: _addEditPromoterForm.control(FormsStatementFGR.email).value,
          phone: _addEditPromoterForm.control(FormsStatementFGR.phone).value,
          provinceName: provinceModel.provinceName,
          provinceModel: provinceModel,
          municipalityName: municipalityModel.municipalityName,
          municipalityModel: municipalityModel,
          address: _addEditPromoterForm.control(FormsStatementFGR.address).value);

      _promoters = (_promoters.toBuilder()
            ..removeAt(index)
            ..add(promoterFRG))
          .build();

      _emitInitialsStates();

      //reset form
      _addEditPromoterForm.reset();

      Navigator.of(context).pop();
    }
  }

  Future<void> deletePromoter(int index) async {
    _promoters = (_promoters.toBuilder()..removeAt(index)).build();
    _emitInitialsStates();
  }

  Future<BuiltList<File>> _checkIfFilesExists(BuiltList<File> files) async {
    var builder = files.toBuilder();

    for (var file in files) {
      if (await file.exists() == false) {
        builder.remove(file);
      }
    }
    return builder.build();
  }
}

// await Future.delayed(Duration(seconds: 5));
abstract class FormsStatementFGR {
  const FormsStatementFGR._();

  static const nameRegExp = r'^[A-Za-z ÁÉÍÓÚÜÇáéíóúüç.-]+$';
  static const phoneRegExp = r'^[0-9 +*-]+$';
  static const idRegExp = r'^([0-9]{2})(0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01])[12][0-9]{4}$';
  static const dateRegExp =
      r'^(0[1-9]|1[0-9]|2[0-9]|3[01])[-/.](0[1-9]|1[012])[-/.](19[23456789][0-9]|20[0][12])$';

  //todo regex for id

  static FormGroup get addStatementForm => FormGroup({
        subject: FormControl<String>(validators: [Validators.required]),
        statement: FormControl<String>(validators: [Validators.required]),
      });

  static FormGroup get addPromoterForm => FormGroup({
        firstName: FormControl<String>(value: null, validators: [Validators.pattern(nameRegExp)]),
        secondName: FormControl<String>(value: null, validators: [Validators.pattern(nameRegExp)]),
        firstLastName:
            FormControl<String>(value: null, validators: [Validators.pattern(nameRegExp)]),
        secondLastName:
            FormControl<String>(value: null, validators: [Validators.pattern(nameRegExp)]),
        id: FormControl<String>(value: null, validators: [
          Validators.pattern(idRegExp),
        ]),
        phone: FormControl<String>(value: null, validators: [Validators.pattern(phoneRegExp)]),
        email: FormControl<String>(value: null, validators: [Validators.email]),
        province: FormControl<ProvinceModel>(value: null, validators: [Validators.required]),
        municipality:
            FormControl<MunicipalityModel>(value: null, validators: [Validators.required]),
        address: FormControl<String>(value: null, validators: []),
      });

  static const subject = 'subject';
  static const statement = 'statement';

  static const firstName = 'firstName';
  static const secondName = 'secondName';
  static const firstLastName = 'firstLastName';
  static const secondLastName = 'secondLastName';
  static const id = 'id';
  static const phone = 'phone';
  static const email = 'email';
  static const province = 'province';
  static const municipality = 'municipality';
  static const address = 'address';
}
