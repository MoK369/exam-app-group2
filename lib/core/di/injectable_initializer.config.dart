// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../dio_service/dio_service.dart' as _i678;
import '../../localization/initializer/initializer.dart' as _i164;
import '../../localization/l10n_manager/localization_manager.dart' as _i375;
import '../../localization/use_case/localization_use_case.dart' as _i964;
import '../../modules/authentication/data/api_manager/auth_api_manager.dart'
    as _i208;
import '../../modules/authentication/data/data_sources_contracts/auth_local_datasource.dart'
    as _i74;
import '../../modules/authentication/data/data_sources_contracts/sign_up/sign_up_remote_data_source.dart'
    as _i186;
import '../../modules/authentication/data/data_sources_imp/auth_local_datasource_impl.dart'
    as _i907;
import '../../modules/authentication/data/data_sources_imp/sign_up/sign_up_data_source_imp.dart'
    as _i522;
import '../../modules/authentication/data/repositories_imp/sign_up/sign_up_repository_imp.dart'
    as _i1059;
import '../../modules/authentication/domain/repositories_contracts/sign_up/sign_up_repository.dart'
    as _i1011;
import '../../modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart'
    as _i367;
import '../../modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart'
    as _i399;
import '../../modules/home/data/api_manager/home_api_manager.dart' as _i945;
import '../../storage/contracts/storage_service_contract.dart' as _i70;
import '../../storage/implementation/storage_service.dart' as _i313;
import '../../storage/initializer/initializer.dart' as _i863;
import '../providers/error/error_notifier.dart' as _i393;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageInitializer = _$StorageInitializer();
    final dioService = _$DioService();
    final localeInitializer = _$LocaleInitializer();
    await gh.factoryAsync<_i558.FlutterSecureStorage>(
      () => storageInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    gh.singleton<_i393.ErrorNotifier>(() => _i393.ErrorNotifier());
    gh.lazySingleton<_i945.HomeApiManager>(() => _i945.HomeApiManager());
    gh.lazySingleton<_i208.AuthApiManager>(() => _i208.AuthApiManager());
    gh.lazySingleton<_i361.Dio>(() => dioService.provideDio());
    gh.factory<_i186.SignUpRemoteDataSource>(() =>
        _i522.SignUpRemoteDataSourceImp(
            apiManager: gh<_i208.AuthApiManager>()));
    gh.singleton<_i70.StorageService<_i558.FlutterSecureStorage>>(
        () => _i313.StorageServiceImp(
              gh<_i393.ErrorNotifier>(),
              gh<_i558.FlutterSecureStorage>(),
            ));
    gh.factory<_i1011.SignUpRepository>(() => _i1059.SignUpRepositoryImp(
        signUpRemoteDataSource: gh<_i186.SignUpRemoteDataSource>()));
    gh.factory<_i74.AuthLocalDataSource>(() => _i907.AuthLocalDataSourceImpl(
        storageService: gh<_i70.StorageService<_i558.FlutterSecureStorage>>()));
    gh.factory<_i367.SignUpUseCase>(() =>
        _i367.SignUpUseCase(signUpRepository: gh<_i1011.SignUpRepository>()));
    gh.factory<_i399.SignUpViewModel>(
        () => _i399.SignUpViewModel(gh<_i367.SignUpUseCase>()));
    await gh.factoryAsync<String>(
      () => localeInitializer.initCurrentLocal(
          gh<_i70.StorageService<_i558.FlutterSecureStorage>>()),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    gh.singleton<_i375.LocalizationManager>(() => _i375.LocalizationManager(
          gh<_i70.StorageService<_i558.FlutterSecureStorage>>(),
          gh<String>(instanceName: 'initCurrentLocal'),
        ));
    gh.factory<_i964.LocalizationUseCase>(
        () => _i964.LocalizationUseCase(gh<_i375.LocalizationManager>()));
    return this;
  }
}

class _$StorageInitializer extends _i863.StorageInitializer {}

class _$DioService extends _i678.DioService {}

class _$LocaleInitializer extends _i164.LocaleInitializer {}
