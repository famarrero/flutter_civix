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
import 'package:flutter_civix/src/domain/repositories/preferences_fgr_repository.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'write_statement_fgr_state.dart';

class WriteStatementFgrCubit extends Cubit<WriteStatementFgrState> {
  final ImagePickerManager _imagePicker;
  final FilePickerManager _filePicker;
  final Directory _directory;
  final PreferencesFGRRepository _preferencesFGR;

  WriteStatementFgrCubit(this._imagePicker, this._filePicker, this._directory,
      this._preferencesFGR)
      : super(WriteStatementFgrState.initial());

  final u = Utils();
  BuiltList<File> _files = BuiltList([]);
  BuiltList<PromoterFRG> _promoters = BuiltList([]);
  List<String> _documentsSupportedList = ['pdf', 'doc', 'xlsx', 'txt'];
  FormGroup _addStatementForm = FormsStatementFGR.addStatementForm;
  FormGroup _addPromoterForm = FormsStatementFGR.addPromoterForm;

  FormGroup get getAddStatementForm => _addStatementForm;

  Future<void> savedStatement() async {
    StatementFRG statementFGR = StatementFRG(
        subject: _addStatementForm.control(FormsStatementFGR.subject).value,
        statement: _addStatementForm.control(FormsStatementFGR.statement).value,
        promoters: _promoters.toList(),
        files: _files.toList());

    await _preferencesFGR.savedStatementFGR(statementFGR);
  }

  Future<void> getSavedStatement() async {
    var savedStatement = await _preferencesFGR.getSavedStatementFGR();

    if (savedStatement != null) {
      _addStatementForm.control(FormsStatementFGR.subject).value =
          savedStatement.subject;
      _addStatementForm.control(FormsStatementFGR.statement).value =
          savedStatement.statement;

      if (savedStatement.promoters != null)
        _promoters = savedStatement.promoters!.toBuiltList();

      if (savedStatement.files != null)
        _files = await _checkIfFilesExists(savedStatement.files!.toBuiltList());

      emit(state.copyWith(
          showSavedStatement: true,
          stateOfPromoters: PromoterListState(promoters: _promoters),
          stateOfFiles: state.stateOfFiles.copyWith(pickedFiles: _files)));
    }
  }

  FormGroup getAddEditPromoterForm({required bool isEdit}) {
    if (isEdit) {
      //todo pass index later
      var promoter = _promoters[0];
      _addPromoterForm.value = {
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
    return _addPromoterForm;
  }

  Future<void> sendStatement() async {
    emit(state.copyWith(
        showSavedStatement: false,
        stateSendStatement: SendStatementState.initial(),
        stateOfFiles: FileListState.initial(pickedFiles: _files)));

    if (_addStatementForm.valid) {
      emit(state.copyWith(
          stateSendStatement:
              state.stateSendStatement.copyWith(isSending: true)));
      //Simulation of send statement
      await Future.delayed(Duration(seconds: 5));
      StatementFRG statementFGR = StatementFRG(
          subject: _addStatementForm.control(FormsStatementFGR.subject).value,
          statement:
              _addStatementForm.control(FormsStatementFGR.statement).value,
          promoters: _promoters.toList(),
          files: _files.toList());
      print(statementFGR.toString());
      emit(state.copyWith(
          stateSendStatement:
              state.stateSendStatement.copyWith(isSending: false, done: true)));
    } else {
      _addStatementForm.control(FormsStatementFGR.subject).markAsTouched();
      _addStatementForm.control(FormsStatementFGR.statement).markAsTouched();
    }
  }

  Future<void> getImageFormCameraOrGallery({required String source}) async {
    emit(state.copyWith(
        showSavedStatement: false,
        stateSendStatement: SendStatementState.initial(),
        stateOfFiles: FileListState.initial(pickedFiles: _files)));

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
        emit(state.copyWith(
            stateOfFiles: state.stateOfFiles.copyWith(error: errorOrCancel)));
      },
      (file) async {
        emit(state.copyWith(
            stateOfFiles: FileListState(
                isLoading: true, pickedFiles: _files, done: false)));

        var nameFile = file.path.split('/').last.split('.').first;
        int quality = 75;
        /**
         * If size of image is more than 1 MB, compress image
         **/
        if (file.readAsBytesSync().lengthInBytes / 1024 / 1024 > 1) {
          quality = 50;
        }
        final imageCompressResponse = await u.compressImage(
            file, '$_newDirectory/$nameFile.webp', quality);
        imageCompressResponse.fold((error) {
          emit(state.copyWith(
              stateOfFiles:
                  state.stateOfFiles.copyWith(isLoading: false, error: error)));
        }, (imageCompress) async {
          _files = (_files.toBuilder()..add(imageCompress)).build();

          file.delete(recursive: true);
        });

        emit(state.copyWith(
            stateOfFiles: FileListState(
                isLoading: false, pickedFiles: _files, done: true)));
      },
    );
  }

  Future<void> getDocument() async {
    emit(state.copyWith(
        showSavedStatement: false,
        stateSendStatement: SendStatementState.initial(),
        stateOfFiles: FileListState.initial(pickedFiles: _files)));

    //todo move file selected to new directory
    final String _newDirectory = '${_directory.path}/AppDocuments';
    await Directory(_newDirectory).create(recursive: true);

    final response =
        await _filePicker.getSingleFileByExtensions(_documentsSupportedList);

    response.fold(
      (errorOrCancel) {
        emit(state.copyWith(
            stateOfFiles: state.stateOfFiles.copyWith(error: errorOrCancel)));
      },
      (file) async {
        if (_documentsSupportedList.contains(file.path.split('.').last)) {
          emit(state.copyWith(
              stateOfFiles: FileListState(
                  isLoading: true, pickedFiles: _files, done: false)));

          _files = (_files.toBuilder()..add(file)).build();

          emit(state.copyWith(
              stateOfFiles: FileListState(
                  isLoading: false, pickedFiles: _files, done: true)));
        } else {
          emit(state.copyWith(
              stateOfFiles: state.stateOfFiles.copyWith(
                  isLoading: false,
                  error:
                      'The file selected is not a document or is not supported')));
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

    emit(state.copyWith(
        showSavedStatement: false,
        stateSendStatement: SendStatementState.initial(),
        stateOfFiles: FileListState.initial(pickedFiles: _files)));
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

  Future<void> addPromoter(BuildContext context) async {
    if (_addPromoterForm.control(FormsStatementFGR.province).invalid) {
      _addPromoterForm.control(FormsStatementFGR.province).markAsTouched();
      _addPromoterForm.control(FormsStatementFGR.province).focus();
    } else if (_addPromoterForm
        .control(FormsStatementFGR.municipality)
        .invalid) {
      _addPromoterForm.control(FormsStatementFGR.municipality).markAsTouched();
      _addPromoterForm.control(FormsStatementFGR.municipality).focus();
    } else {
      var provinceModel = _addPromoterForm
          .control(FormsStatementFGR.province)
          .value as ProvinceModel;
      var municipalityModel = _addPromoterForm
          .control(FormsStatementFGR.municipality)
          .value as MunicipalityModel;
      PromoterFRG promoterFRG = PromoterFRG(
          firstName:
              _addPromoterForm.control(FormsStatementFGR.firstName).value,
          secondName:
              _addPromoterForm.control(FormsStatementFGR.secondName).value,
          firstLastName:
              _addPromoterForm.control(FormsStatementFGR.firstLastName).value,
          secondLastName:
              _addPromoterForm.control(FormsStatementFGR.secondLastName).value,
          id: _addPromoterForm.control(FormsStatementFGR.id).value,
          email: _addPromoterForm.control(FormsStatementFGR.email).value,
          phone: _addPromoterForm.control(FormsStatementFGR.phone).value,
          provinceName: provinceModel.provinceName,
          provinceModel: provinceModel,
          municipalityName: municipalityModel.municipalityName,
          municipalityModel: municipalityModel,
          address: _addPromoterForm.control(FormsStatementFGR.address).value);
      _promoters = (_promoters.toBuilder()..add(promoterFRG)).build();
      emit(state.copyWith(
          showSavedStatement: false,
          stateSendStatement: SendStatementState.initial(),
          stateOfFiles: FileListState.initial(pickedFiles: _files),
          stateOfPromoters: PromoterListState(promoters: _promoters)));

      //reset form
      _addPromoterForm.reset();

      Navigator.of(context).pop();
    }
  }

  Future<void> editPromoter(BuildContext context, int index) async {
    if (_addPromoterForm.control(FormsStatementFGR.province).invalid) {
      _addPromoterForm.control(FormsStatementFGR.province).markAsTouched();
      _addPromoterForm.control(FormsStatementFGR.province).focus();
    } else if (_addPromoterForm
        .control(FormsStatementFGR.municipality)
        .invalid) {
      _addPromoterForm.control(FormsStatementFGR.municipality).markAsTouched();
      _addPromoterForm.control(FormsStatementFGR.municipality).focus();
    } else {
      var provinceModel = _addPromoterForm
          .control(FormsStatementFGR.province)
          .value as ProvinceModel;
      var municipalityModel = _addPromoterForm
          .control(FormsStatementFGR.municipality)
          .value as MunicipalityModel;
      PromoterFRG promoterFRG = PromoterFRG(
          firstName:
              _addPromoterForm.control(FormsStatementFGR.firstName).value,
          secondName:
              _addPromoterForm.control(FormsStatementFGR.secondName).value,
          firstLastName:
              _addPromoterForm.control(FormsStatementFGR.firstLastName).value,
          secondLastName:
              _addPromoterForm.control(FormsStatementFGR.secondLastName).value,
          id: _addPromoterForm.control(FormsStatementFGR.id).value,
          email: _addPromoterForm.control(FormsStatementFGR.email).value,
          phone: _addPromoterForm.control(FormsStatementFGR.phone).value,
          provinceName: provinceModel.provinceName,
          provinceModel: provinceModel,
          municipalityName: municipalityModel.municipalityName,
          municipalityModel: municipalityModel,
          address: _addPromoterForm.control(FormsStatementFGR.address).value);

      _promoters = (_promoters.toBuilder()
            ..removeAt(index)
            ..add(promoterFRG))
          .build();

      emit(state.copyWith(
          showSavedStatement: false,
          stateSendStatement: SendStatementState.initial(),
          stateOfFiles: FileListState.initial(pickedFiles: _files),
          stateOfPromoters: PromoterListState(promoters: _promoters)));

      //reset form
      _addPromoterForm.reset();

      Navigator.of(context).pop();
    }
  }

  Future<void> deletePromoter(int index) async {
    _promoters = (_promoters.toBuilder()..removeAt(index)).build();
    emit(state.copyWith(
        showSavedStatement: false,
        stateSendStatement: SendStatementState.initial(),
        stateOfFiles: FileListState.initial(pickedFiles: _files),
        stateOfPromoters: PromoterListState(promoters: _promoters)));
  }
}
// await Future.delayed(Duration(seconds: 5));

abstract class FormsStatementFGR {
  const FormsStatementFGR._();

  static const nameRegExp = r'^[A-Za-z ÁÉÍÓÚÜÇáéíóúüç.-]+$';
  static const phoneRegExp = r'^[0-9 +*-]+$';

  //todo regex for id

  static FormGroup get addStatementForm => FormGroup({
        subject: FormControl<String>(validators: [Validators.required]),
        statement: FormControl<String>(validators: [Validators.required]),
      });

  static FormGroup get addPromoterForm => FormGroup({
        firstName: FormControl<String>(
            value: null, validators: [Validators.pattern(nameRegExp)]),
        secondName: FormControl<String>(
            value: null, validators: [Validators.pattern(nameRegExp)]),
        firstLastName: FormControl<String>(
            value: null, validators: [Validators.pattern(nameRegExp)]),
        secondLastName: FormControl<String>(
            value: null, validators: [Validators.pattern(nameRegExp)]),
        id: FormControl<String>(
            value: null, validators: [Validators.minLength(11)]),
        phone: FormControl<String>(
            value: null, validators: [Validators.pattern(phoneRegExp)]),
        email: FormControl<String>(value: null, validators: [Validators.email]),
        province: FormControl<ProvinceModel>(
            value: null, validators: [Validators.required]),
        municipality: FormControl<MunicipalityModel>(
            value: null, validators: [Validators.required]),
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
