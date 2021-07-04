import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_civix/src/core/services_manager/file_picker_manager.dart';
import 'package:flutter_civix/src/core/services_manager/file_picker_manager_impl.dart';
import 'package:flutter_civix/src/core/services_manager/image_picker_manager.dart';
import 'package:flutter_civix/src/core/services_manager/image_picker_manager_impl.dart';
import 'package:flutter_civix/src/core/services_manager/url_launcher.dart';
import 'package:flutter_civix/src/data/data_sources/local_data/local_database/daos/statement_fgr_dao.dart';
import 'package:flutter_civix/src/data/data_sources/local_data/local_database/moor_database.dart';
import 'package:flutter_civix/src/data/data_sources/local_data/shared_preferences/shared_preferences_fgr.dart';
import 'package:flutter_civix/src/data/repositories/database_fgr_repository_impl.dart';
import 'package:flutter_civix/src/data/repositories/local_assets_repository_impl.dart';
import 'package:flutter_civix/src/data/repositories/preferences_fgr_repository_impl.dart';
import 'package:flutter_civix/src/domain/repositories/database_fgr_repository.dart';
import 'package:flutter_civix/src/domain/repositories/local_assets_repository.dart';
import 'package:flutter_civix/src/domain/repositories/preferences_fgr_repository.dart';
import 'package:flutter_civix/src/presentation/manager/provinces_list_cubit/provinces_list_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/consult_state_fgr/cubit/consult_state_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/show_statement_fgr/cubit/show_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/general/contact_us/cubit/contact_us_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/general/entities_by_province/cubit/entities_by_province_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/general/frequent_questions/cubit/frequent_questions_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/general/informative_texts/cubit/informative_texts_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await registerStorageDirectory();

  //**
  // - I register the instance like registerLazySingleton() because i need that the
  // instance register the first time that in call them.
  // - If i register the instance like registerSingleton() the instance will be created at the first time that app start
  //**/

  // Dio client
  injector.registerLazySingleton<Dio>(() => Dio());

  // Preferences
  injector.registerLazySingleton<SharedPreferencesFGR>(() => SharedPreferencesFGR());

  // Database
  injector.registerLazySingleton<AppDatabase>(() => AppDatabase());
  injector.registerLazySingleton<StatementFGRDao>(() => StatementFGRDao(injector()));

  // Repositories
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
  injector.registerLazySingleton<UrlLauncherManager>(
        () => UrlLauncherManagerImpl(),
  );

  // Blocs/Cubits
  //**
  // They are register like registerFactory because every time i need a new instance of the BloC/Cubit
  //**
  injector.registerFactory<WriteStatementFgrCubit>(
      () => WriteStatementFgrCubit(injector(), injector(), injector(), injector(), injector()));
  injector.registerFactory<ProvincesListCubit>(() => ProvincesListCubit(injector()));
  injector.registerFactory<ListStatementFgrCubit>(() => ListStatementFgrCubit(injector()));
  injector.registerFactory<ShowStatementFgrCubit>(() => ShowStatementFgrCubit(injector()));
  injector.registerFactory<ConsultStateFgrCubit>(() => ConsultStateFgrCubit());
  injector.registerFactory<FrequentQuestionsCubit>(() => FrequentQuestionsCubit(injector()));
  injector.registerFactory<InformativeTextsCubit>(() => InformativeTextsCubit(injector()));
  injector.registerFactory<EntitiesByProvinceCubit>(() => EntitiesByProvinceCubit(injector()));
  injector.registerFactory<ContactUsCubit>(() => ContactUsCubit(injector()));

  // UseCases
  // injector.registerSingleton<GetRemotePostsUseCase>(
  // GetRemotePostsUseCase(injector()));
  // Dependencies
  // injector.registerSingleton<DioApiProvider>(DioApiProvider(injector()));
}

Future<void> registerStorageDirectory() async {
  if (kIsWeb) {
    final webStorageDirectory = Directory('');
    injector.registerLazySingleton(() => webStorageDirectory);
  } else if (Platform.isAndroid) {
    final Directory? dir = await getExternalStorageDirectory();
    if (dir != null) {
      injector.registerLazySingleton(() => dir);
    }
  } else if (Platform.isIOS) {
    final Directory dir = await getApplicationDocumentsDirectory();
    injector.registerLazySingleton(() => dir);
  }
}
