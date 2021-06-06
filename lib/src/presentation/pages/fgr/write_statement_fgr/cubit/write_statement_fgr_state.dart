part of 'write_statement_fgr_cubit.dart';

class WriteStatementFgrState extends Equatable {
  final SendStatementState stateSendStatement;
  final FileListState stateOfFiles;
  final PromoterListState stateOfPromoters;
  final String? showMessage;

  const WriteStatementFgrState(
      {required this.stateSendStatement,
      required this.stateOfFiles,
      required this.stateOfPromoters,
      required this.showMessage});

  factory WriteStatementFgrState.initial() => WriteStatementFgrState(
      stateSendStatement: SendStatementState.initial(),
      stateOfFiles: FileListState.initial(),
      stateOfPromoters: PromoterListState.initial(),
      showMessage: null);

  WriteStatementFgrState copyWith(
      {SendStatementState? stateSendStatement,
      FileListState? stateOfFiles,
      PromoterListState? stateOfPromoters,
      String? showMessage}) {
    return WriteStatementFgrState(
      stateSendStatement: stateSendStatement ?? this.stateSendStatement,
      stateOfFiles: stateOfFiles ?? this.stateOfFiles,
      stateOfPromoters: stateOfPromoters ?? this.stateOfPromoters,
      showMessage: showMessage ?? this.showMessage,
    );
  }

  @override
  List<Object?> get props => [stateSendStatement, stateOfFiles, stateOfPromoters, showMessage];
}

class SendStatementState extends Equatable {
  final bool isSending;
  final bool done;
  final String? error;

  const SendStatementState({required this.isSending, required this.done, this.error});

  // factory SendStatementState.initial() =>
  //     SendStatementState(isSending: false, done: false, error: null);

  factory SendStatementState.initial({bool? isSending, bool? done, String? error}) =>
      SendStatementState(
        isSending: isSending ?? false,
        done: done ?? false,
        error: error ?? null,
      );

  SendStatementState copyWith({bool? isSending, bool? done, String? error}) {
    return SendStatementState(
      isSending: isSending ?? this.isSending,
      done: done ?? this.done,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isSending, done, error];
}

class FileListState extends Equatable {
  final bool isLoading;
  final BuiltList<File> pickedFiles;
  final bool done;
  final String? error;

  const FileListState(
      {required this.isLoading, required this.pickedFiles, required this.done, this.error});

  // factory FileListState.initial() => FileListState(
  //     isLoading: false, pickedFiles: BuiltList([]), done: false, error: null);

  factory FileListState.initial(
          {bool? isLoading, BuiltList<File>? pickedFiles, bool? done, String? error}) =>
      FileListState(
        isLoading: isLoading ?? false,
        pickedFiles: pickedFiles ?? BuiltList([]),
        done: done ?? false,
        error: error ?? null,
      );

  FileListState copyWith(
      {bool? isLoading, BuiltList<File>? pickedFiles, bool? done, String? error}) {
    return FileListState(
      isLoading: isLoading ?? this.isLoading,
      pickedFiles: pickedFiles ?? this.pickedFiles,
      done: done ?? this.done,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, pickedFiles, done, error];
}

class PromoterListState extends Equatable {
  final BuiltList<PromoterFRG> promoters;

  const PromoterListState({
    required this.promoters,
  });

  factory PromoterListState.initial() => PromoterListState(promoters: BuiltList([]));

  @override
  List<Object?> get props => [promoters];
}
