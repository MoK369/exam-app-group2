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
import '../../localization/l10n_manager/localization_manager.dart' as _i375;
import '../../modules/authentication/data/api/api_manager.dart' as _i920;
import '../../modules/authentication/data/api_manager/api_manager.dart'
    as _i355;
import '../../modules/authentication/data/data_sources_contracts/sign_up/sign_up_remote_data_source.dart'
    as _i186;
import '../../modules/authentication/data/data_sources_imp/sign_up/sign_up_data_source_imp.dart'
    as _i522;
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
import '../../modules/authentication/data/repositories_imp/sign_up/sign_up_repository_imp.dart'
    as _i1059;
import '../../modules/authentication/domain/repo_contract/login_repo.dart'
    as _i723;
import '../../modules/authentication/domain/repositories_constracts/sign_up/sign_up_repository.dart'
    as _i745;
import '../../modules/authentication/domain/use_cases/localization/localization_use_case.dart'
    as _i618;
import '../../modules/authentication/domain/use_cases/login/login_use_case.dart'
    as _i543;
import '../../modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart'
    as _i367;
import '../../modules/authentication/ui/login/view_model/login_cubit.dart'
    as _i953;
import '../../modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart'
    as _i399;
import '../../storage/contracts/storage_service_contract.dart' as _i70;
import '../../storage/implementation/storage_service.dart' as _i313;

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
    final dioService = _$DioService();
    gh.factory<_i355.ApiManager>(() => _i355.ApiManager());
    gh.singleton<_i361.Dio>(() => dioService.provideDio());
    gh.singleton<_i375.LocalizationManager>(() => _i375.LocalizationManager());
    gh.factory<_i186.SignUpRemoteDataSource>(() =>
        _i522.SignUpRemoteDataSourceImp(apiManager: gh<_i355.ApiManager>()));
    gh.singleton<_i70.StorageService<_i558.FlutterSecureStorage>>(
        () => _i313.StorageServiceImp());
    gh.factory<_i745.SignUpRepository>(() => _i1059.SignUpRepositoryImp(
        signUpRemoteDataSource: gh<_i186.SignUpRemoteDataSource>()));
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
    gh.factory<_i367.SignUpUseCase>(() =>
        _i367.SignUpUseCase(signUpRepository: gh<_i745.SignUpRepository>()));
    gh.factory<_i399.SignUpViewModel>(
        () => _i399.SignUpViewModel(gh<_i367.SignUpUseCase>()));
    gh.factory<_i543.LoginUseCase>(
        () => _i543.LoginUseCase(authRepo: gh<_i723.LoginRepo>()));
    gh.factory<_i953.LoginCubit>(
        () => _i953.LoginCubit(loginUseCase: gh<_i543.LoginUseCase>()));
    return this;
  }
}

class _$DioService extends _i678.DioService {}
