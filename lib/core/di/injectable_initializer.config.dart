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

import '../../localization/l10n_manager/localization_manager.dart' as _i375;
import '../../modules/authentication/data/api/api_manager.dart' as _i920;
import '../../modules/authentication/data/datasource_contract/auth_local_datasource.dart'
    as _i493;
import '../../modules/authentication/data/datasource_contract/login_remote_datasource.dart'
    as _i975;
import '../../modules/authentication/data/datasource_impl/auth_local_datasource_impl.dart'
    as _i1032;
import '../../modules/authentication/data/datasource_impl/login_remote_data_source_impl.dart'
    as _i281;
import '../../modules/authentication/data/repo_impl/login_repo_impl.dart'
    as _i248;
import '../../modules/authentication/domain/repo_contract/login_repo.dart'
    as _i723;
import '../../modules/authentication/domain/use_cases/localization/localization_use_case.dart'
    as _i618;
import '../../modules/authentication/domain/use_cases/login/login_use_case.dart'
    as _i543;
import '../../modules/authentication/ui/login/view_model/login_cubit.dart'
    as _i953;
import '../../storage/contracts/storage_service_contract.dart' as _i70;
import '../../storage/implementation/storage_service.dart' as _i313;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i375.LocalizationManager>(() => _i375.LocalizationManager());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i70.StorageService<_i558.FlutterSecureStorage>>(
        () => _i313.StorageServiceImp());
    gh.singleton<_i920.ApiManager>(
        () => _i920.ApiManager(dio: gh<_i361.Dio>()));
    gh.factory<_i618.LocalizationUseCase>(
        () => _i618.LocalizationUseCase(gh<_i375.LocalizationManager>()));
    gh.factory<_i975.LoginRemoteDataSource>(() =>
        _i281.LoginRemoteDataSourceImpl(apiManager: gh<_i920.ApiManager>()));
    gh.factory<_i493.AuthLocalDataSource>(() => _i1032.AuthLocalDataSourceImpl(
        storageService: gh<_i70.StorageService<_i558.FlutterSecureStorage>>()));
    gh.factory<_i723.LoginRepo>(() => _i248.LoginRepoImpl(
          authRemoteDataSource: gh<_i975.LoginRemoteDataSource>(),
          authLocalDataSource: gh<_i493.AuthLocalDataSource>(),
        ));
    gh.factory<_i543.LoginUseCase>(
        () => _i543.LoginUseCase(authRepo: gh<_i723.LoginRepo>()));
    gh.factory<_i953.LoginCubit>(
        () => _i953.LoginCubit(loginUseCase: gh<_i543.LoginUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
