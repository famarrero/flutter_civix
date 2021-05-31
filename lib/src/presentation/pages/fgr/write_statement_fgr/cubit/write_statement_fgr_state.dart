part of 'write_statement_fgr_cubit.dart';

class WriteStatementFgrState extends Equatable {
  final FileListState stateOfFiles;

  const WriteStatementFgrState({required this.stateOfFiles});

  factory WriteStatementFgrState.initial() =>
      WriteStatementFgrState(stateOfFiles: FileListState.initial());

  WriteStatementFgrState copyWith({FileListState? stateOfFiles}) {
    return WriteStatementFgrState(
        stateOfFiles: stateOfFiles ?? this.stateOfFiles);
  }

  @override
  List<Object?> get props => [stateOfFiles];
}

class FileListState extends Equatable {
  final bool isLoading;
  final BuiltList<File> pickedFiles;
  final bool done;
  final String? error;

  const FileListState(
      {required this.isLoading,
      required this.pickedFiles,
      required this.done,
      this.error});

  factory FileListState.initial() => FileListState(
      isLoading: false, pickedFiles: BuiltList([]), done: false, error: null);

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
