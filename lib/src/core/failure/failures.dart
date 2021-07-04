import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message];
}

// NetWork Failure failures
class NetWorkFailure extends Failure {
  const NetWorkFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class ComputationFailure extends Failure {
  const ComputationFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class DioServerFailure extends NetWorkFailure {
  const DioServerFailure({String message = "", this.errorType}) : super(message);
  final DioErrorType? errorType;
  @override
  List<Object?> get props => [message, errorType];
}

//Casi siempre problema de conectividad
class DioRequestFailure extends NetWorkFailure {
  const DioRequestFailure({String message = "", this.errorType}) : super(message);
  final DioErrorType? errorType;
  @override
  List<Object?> get props => [message, errorType];
}

class FilePickerFailure extends Failure {
  const FilePickerFailure(String message) : super(message);
  @override
  List<Object?> get props => [message];
}

class CancelFilePickerFailure extends Failure {
  const CancelFilePickerFailure(String message) : super(message);
  @override
  List<Object?> get props => [message];
}

class CancelImageCropFailure extends Failure {
  const CancelImageCropFailure(String message) : super(message);
  @override
  List<Object?> get props => [message];
}

class CallPhoneFailure extends Failure {
  const CallPhoneFailure(String message) : super(message);
  @override
  List<Object?> get props => [message];
}

class SendEmailFailure extends Failure {
  const SendEmailFailure(String message) : super(message);
  @override
  List<Object?> get props => [message];
}

class OpenUrlFailure extends Failure {
  const OpenUrlFailure(String message) : super(message);
  @override
  List<Object?> get props => [message];
}
