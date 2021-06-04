import 'dart:io';

import 'package:flutter_civix/src/core/services_manager/file_picker_manager.dart';
import 'package:flutter_civix/src/core/services_manager/file_picker_manager_impl.dart';
import 'package:flutter_civix/src/core/services_manager/image_picker_manager.dart';
import 'package:flutter_civix/src/core/services_manager/image_picker_manager_impl.dart';
import 'package:flutter_civix/src/data/data_sources/local_data/local_assets_impl.dart';
import 'package:flutter_civix/src/data/repositories/local_assets.dart';
import 'package:flutter_civix/src/presentation/manager/provinces_list_cuibit/provinces_list_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {

  await registerDir();

  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  // injector.registerSingleton<DioApiProvider>(DioApiProvider(injector()));

  //Repositories
  injector.registerSingleton<LocalAssets>(
    LocalAssetsImpl(),
  );
  injector.registerSingleton<ImagePickerManager>(
    ImagePickerManagerImpl(),
  );
  injector.registerSingleton<FilePickerManager>(
    FilePickerManagerImpl(),
  );

  // UseCases
  // injector.registerSingleton<GetRemotePostsUseCase>(
  //     GetRemotePostsUseCase(injector()));

  // Blocs
  injector.registerFactory<WriteStatementFgrCubit>(() => WriteStatementFgrCubit(injector(), injector(), injector()));
  injector.registerFactory<ProvincesListCubit>(() => ProvincesListCubit(injector()));
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
