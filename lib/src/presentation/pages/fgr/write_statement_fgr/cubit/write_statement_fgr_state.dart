part of 'write_statement_fgr_cubit.dart';

class WriteStatementFgrState extends Equatable {
  final FileListState stateOfFiles;

  const WriteStatementFgrState({required this.stateOfFiles});

  factory WriteStatementFgrState.initial() =>
      WriteStatementFgrState(
          stateOfFiles: FileListState.initial()
      );

  WriteStatementFgrState copyWith({FileListState? stateOfFiles}) {
    return WriteStatementFgrState(
        stateOfFiles: stateOfFiles ?? this.stateOfFiles);
  }

  @override
  List<Object?> get props => [stateOfFiles];
}

class FileListState extends Equatable {
  final bool isLoading;
  final List<File> pickedFiles;
  final bool done;

  const FileListState(
      {required this.isLoading, required this.pickedFiles, required this.done});

  factory FileListState.initial() =>
      FileListState(
        isLoading: false,
        pickedFiles: [],
        done: false,
      );

  FileListState copyWith(
      {bool? isLoading, List<File>? pickedFiles, bool? done}) {
    return FileListState(
      isLoading: isLoading ?? this.isLoading,
      pickedFiles: pickedFiles ?? this.pickedFiles,
      done: done ?? this.done,
    );
  }

  @override
  List<Object?> get props => [isLoading, pickedFiles, done];
}
