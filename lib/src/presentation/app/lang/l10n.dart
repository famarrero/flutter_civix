// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search..`
  String get searchHint {
    return Intl.message(
      'Search..',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Connecting...`
  String get connecting {
    return Intl.message(
      'Connecting...',
      name: 'connecting',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Deleting`
  String get deleting {
    return Intl.message(
      'Deleting',
      name: 'deleting',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get choose {
    return Intl.message(
      'Choose',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel2 {
    return Intl.message(
      'Cancel',
      name: 'cancel2',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Later`
  String get later {
    return Intl.message(
      'Later',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Creating`
  String get creating {
    return Intl.message(
      'Creating',
      name: 'creating',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Updating`
  String get updating {
    return Intl.message(
      'Updating',
      name: 'updating',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade`
  String get upgrade {
    return Intl.message(
      'Upgrade',
      name: 'upgrade',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message(
      'Call',
      name: 'call',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation`
  String get passwordMatch {
    return Intl.message(
      'Password Confirmation',
      name: 'passwordMatch',
      desc: '',
      args: [],
    );
  }

  /// `A value is required`
  String get emptyValidator {
    return Intl.message(
      'A value is required',
      name: 'emptyValidator',
      desc: '',
      args: [],
    );
  }

  /// `Passwords must match`
  String get passwordValidator {
    return Intl.message(
      'Passwords must match',
      name: 'passwordValidator',
      desc: '',
      args: [],
    );
  }

  /// `Email is invalid`
  String get emailValidator {
    return Intl.message(
      'Email is invalid',
      name: 'emailValidator',
      desc: '',
      args: [],
    );
  }

  /// `Warning!!`
  String get warning {
    return Intl.message(
      'Warning!!',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get info {
    return Intl.message(
      'Information',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get themeLight {
    return Intl.message(
      'Light Theme',
      name: 'themeLight',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get themeDark {
    return Intl.message(
      'Dark Theme',
      name: 'themeDark',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get languageSelect {
    return Intl.message(
      'Language',
      name: 'languageSelect',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Options`
  String get options {
    return Intl.message(
      'Options',
      name: 'options',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Expire`
  String get expire {
    return Intl.message(
      'Expire',
      name: 'expire',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation!`
  String get congrats {
    return Intl.message(
      'Congratulation!',
      name: 'congrats',
      desc: '',
      args: [],
    );
  }

  /// `Main FGR`
  String get mainFGR {
    return Intl.message(
      'Main FGR',
      name: 'mainFGR',
      desc: '',
      args: [],
    );
  }

  /// `General Prosecutor of the Republic`
  String get fgr {
    return Intl.message(
      'General Prosecutor of the Republic',
      name: 'fgr',
      desc: '',
      args: [],
    );
  }

  /// `Enter subject`
  String get enterSubject {
    return Intl.message(
      'Enter subject',
      name: 'enterSubject',
      desc: '',
      args: [],
    );
  }

  /// `Enter statement`
  String get enterStatement {
    return Intl.message(
      'Enter statement',
      name: 'enterStatement',
      desc: '',
      args: [],
    );
  }

  /// `The statement must o be null`
  String get statementValidator {
    return Intl.message(
      'The statement must o be null',
      name: 'statementValidator',
      desc: '',
      args: [],
    );
  }

  /// `The subject must o be null`
  String get subjectValidator {
    return Intl.message(
      'The subject must o be null',
      name: 'subjectValidator',
      desc: '',
      args: [],
    );
  }

  /// `Write statement`
  String get writeStatement {
    return Intl.message(
      'Write statement',
      name: 'writeStatement',
      desc: '',
      args: [],
    );
  }

  /// `Add promoter`
  String get addPromoter {
    return Intl.message(
      'Add promoter',
      name: 'addPromoter',
      desc: '',
      args: [],
    );
  }

  /// `Edit promoter`
  String get editPromoter {
    return Intl.message(
      'Edit promoter',
      name: 'editPromoter',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Second name`
  String get secondName {
    return Intl.message(
      'Second name',
      name: 'secondName',
      desc: '',
      args: [],
    );
  }

  /// `First last name`
  String get firstLastName {
    return Intl.message(
      'First last name',
      name: 'firstLastName',
      desc: '',
      args: [],
    );
  }

  /// `Second last name`
  String get secondLastName {
    return Intl.message(
      'Second last name',
      name: 'secondLastName',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id {
    return Intl.message(
      'ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get province {
    return Intl.message(
      'Province',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  /// `Municipality`
  String get municipality {
    return Intl.message(
      'Municipality',
      name: 'municipality',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Attachments`
  String get attachments {
    return Intl.message(
      'Attachments',
      name: 'attachments',
      desc: '',
      args: [],
    );
  }

  /// `Document`
  String get document {
    return Intl.message(
      'Document',
      name: 'document',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `The first name must be a valid name`
  String get firstNameCorrectValidator {
    return Intl.message(
      'The first name must be a valid name',
      name: 'firstNameCorrectValidator',
      desc: '',
      args: [],
    );
  }

  /// `The second name name must be a valid name`
  String get secondNameCorrectValidator {
    return Intl.message(
      'The second name name must be a valid name',
      name: 'secondNameCorrectValidator',
      desc: '',
      args: [],
    );
  }

  /// `The first last name must be a valid name`
  String get firstLastNameCorrectValidator {
    return Intl.message(
      'The first last name must be a valid name',
      name: 'firstLastNameCorrectValidator',
      desc: '',
      args: [],
    );
  }

  /// `The second last name must be a valid name`
  String get secondLastNameCorrectValidator {
    return Intl.message(
      'The second last name must be a valid name',
      name: 'secondLastNameCorrectValidator',
      desc: '',
      args: [],
    );
  }

  /// `The email must be a correct email`
  String get emailCorrectValidator {
    return Intl.message(
      'The email must be a correct email',
      name: 'emailCorrectValidator',
      desc: '',
      args: [],
    );
  }

  /// `The id must be a correct id`
  String get idCorrectValidator {
    return Intl.message(
      'The id must be a correct id',
      name: 'idCorrectValidator',
      desc: '',
      args: [],
    );
  }

  /// `The phone must be a correct phone`
  String get phoneCorrectValidator {
    return Intl.message(
      'The phone must be a correct phone',
      name: 'phoneCorrectValidator',
      desc: '',
      args: [],
    );
  }

  /// `The province is required`
  String get provinceRequiredValidator {
    return Intl.message(
      'The province is required',
      name: 'provinceRequiredValidator',
      desc: '',
      args: [],
    );
  }

  /// `The municipality is required`
  String get municipalityRequiredValidator {
    return Intl.message(
      'The municipality is required',
      name: 'municipalityRequiredValidator',
      desc: '',
      args: [],
    );
  }

  /// `Save eraser`
  String get saveEraser {
    return Intl.message(
      'Save eraser',
      name: 'saveEraser',
      desc: '',
      args: [],
    );
  }

  /// `Nothing to save`
  String get nothingToSave {
    return Intl.message(
      'Nothing to save',
      name: 'nothingToSave',
      desc: '',
      args: [],
    );
  }

  /// `Statement saved`
  String get statementSaved {
    return Intl.message(
      'Statement saved',
      name: 'statementSaved',
      desc: '',
      args: [],
    );
  }

  /// `Showing saved statement`
  String get showingSadevStatement {
    return Intl.message(
      'Showing saved statement',
      name: 'showingSadevStatement',
      desc: '',
      args: [],
    );
  }

  /// `The file selected is not a document or is not supported`
  String get documentNotSupported {
    return Intl.message(
      'The file selected is not a document or is not supported',
      name: 'documentNotSupported',
      desc: '',
      args: [],
    );
  }

  /// `No file selected`
  String get noFileSelected {
    return Intl.message(
      'No file selected',
      name: 'noFileSelected',
      desc: '',
      args: [],
    );
  }

  /// `No image selected`
  String get noImageSelected {
    return Intl.message(
      'No image selected',
      name: 'noImageSelected',
      desc: '',
      args: [],
    );
  }

  /// `No image taked`
  String get noImageTaked {
    return Intl.message(
      'No image taked',
      name: 'noImageTaked',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
