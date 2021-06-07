import 'dart:io';

import 'package:flutter_civix/src/core/services_manager/file_picker_manager.dart';
import 'package:flutter_civix/src/core/services_manager/file_picker_manager_impl.dart';
import 'package:flutter_civix/src/core/services_manager/image_picker_manager.dart';
import 'package:flutter_civix/src/core/services_manager/image_picker_manager_impl.dart';
import 'package:flutter_civix/src/data/data_sources/local_data/local_database/daos/statement_fgr_dao.dart';
import 'package:flutter_civix/src/data/data_sources/local_data/local_database/moor_database.dart';
import 'package:flutter_civix/src/data/data_sources/local_data/shared_preferences/shared_preferences_fgr.dart';
import 'package:flutter_civix/src/data/repositories/database_fgr_repository_impl.dart';
import 'package:flutter_civix/src/data/repositories/local_assets_repository_impl.dart';
import 'package:flutter_civix/src/data/repositories/preferences_fgr_repository_impl.dart';
import 'package:flutter_civix/src/domain/repositories/database_fgr_repository.dart';
import 'package:flutter_civix/src/domain/repositories/local_assets_repository.dart';
import 'package:flutter_civix/src/domain/repositories/preferences_fgr_repository.dart';
import 'package:flutter_civix/src/presentation/manager/provinces_list_cuibit/provinces_list_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await registerDir();

  // Dio client
  injector.registerLazySingleton<Dio>(() => Dio());

  //Database
  injector.registerLazySingleton<AppDatabase>(() => AppDatabase());
  injector.registerLazySingleton(() => StatementFGRDao(injector()));

  //
  injector.registerSingleton<SharedPreferencesFGR>(SharedPreferencesFGR());

  //Repositories
  injector.registerLazySingleton<DataBaseFGRRepository>(
    () => DataBaseFGRRepositoryImpl(injector()),
  );
  injector.registerLazySingleton<LocalAssetsRepository>(
    () => LocalAssetsRepositoryImpl(),
  );
  injector.registerLazySingleton<PreferencesFGRRepository>(
    () => PreferencesFGRRepositoryImpl(injector()),
  );
  injector.registerLazySingleton<ImagePickerManager>(
    () => ImagePickerManagerImpl(),
  );
  injector.registerLazySingleton<FilePickerManager>(
    () => FilePickerManagerImpl(),
  );

  // Blocs
  injector.registerLazySingleton<WriteStatementFgrCubit>(
      () => WriteStatementFgrCubit(injector(), injector(), injector(), injector(), injector()));
  injector.registerLazySingleton<ProvincesListCubit>(() => ProvincesListCubit(injector()));
  injector.registerLazySingleton<ListStatementFgrCubit>(() => ListStatementFgrCubit(injector()));

  // UseCases
  // injector.registerSingleton<GetRemotePostsUseCase>(
  // GetRemotePostsUseCase(injector()));
  // Dependencies
  // injector.registerSingleton<DioApiProvider>(DioApiProvider(injector()));
}

Future<void> registerDir() async {
  if (Platform.isAndroid) {
    final Directory? dir = await getExternalStorageDirectory();
    if (dir != null) {
      injector.registerLazySingleton(() => dir);
    } else {
      final Directory fallbackDir = await getApplicationDocumentsDirectory();
      injector.registerLazySingleton(() => fallbackDir);
    }
  } else {
    final Directory dir = await getApplicationDocumentsDirectory();
    injector.registerLazySingleton(() => dir);
  }
}
