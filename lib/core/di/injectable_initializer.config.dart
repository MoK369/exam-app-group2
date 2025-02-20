// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../localization/l10n_manager/localization_manager.dart' as _i375;
import '../../modules/authentication/data/api/api_manager.dart' as _i920;
import '../../modules/authentication/data/datasource_contract/auth_local_datasource.dart'
    as _i493;
import '../../modules/authentication/data/datasource_contract/auth_remote_datasource.dart'
    as _i536;
import '../../modules/authentication/data/datasource_impl/auth_local_datasource_impl.dart'
    as _i1032;
import '../../modules/authentication/data/datasource_impl/auth_remote_data_source_impl.dart'
    as _i1046;
import '../../modules/authentication/data/repo_impl/auth_repo_impl.dart'
    as _i869;
import '../../modules/authentication/domain/repo_contract/auth_repo.dart'
    as _i292;
import '../../modules/authentication/domain/use_cases/localization/localization_use_case.dart'
    as _i618;
import '../../modules/authentication/domain/usecases/login_use_case.dart'
    as _i243;
import '../../modules/authentication/ui/login/viewModel/login_cubit.dart'
    as _i270;
import '../service/cash_service.dart' as _i115;
import 'register_module.dart' as _i291;

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
    final registerModule = _$RegisterModule();
    gh.singleton<_i375.LocalizationManager>(() => _i375.LocalizationManager());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingletonAsync<_i460.SharedPreferences>(() => registerModule.prefs);
    gh.factoryAsync<_i115.CashService>(() async => _i115.CashServiceImpl(
        sharedPreferences: await getAsync<_i460.SharedPreferences>()));
    gh.singleton<_i920.ApiManager>(
        () => _i920.ApiManager(dio: gh<_i361.Dio>()));
    gh.factory<_i618.LocalizationUseCase>(
        () => _i618.LocalizationUseCase(gh<_i375.LocalizationManager>()));
    gh.factoryAsync<_i493.AuthLocalDataSource>(() async =>
        _i1032.AuthLocalDataSourceImpl(
            cashService: await getAsync<_i115.CashService>()));
    gh.factory<_i536.AuthRemoteDataSource>(() =>
        _i1046.AuthRemoteDataSourceImpl(apiManager: gh<_i920.ApiManager>()));
    gh.factoryAsync<_i292.AuthRepo>(() async => _i869.AuthRepoImpl(
          authRemoteDataSource: gh<_i536.AuthRemoteDataSource>(),
          authLocalDataSource: await getAsync<_i493.AuthLocalDataSource>(),
        ));
    gh.factoryAsync<_i243.LoginUseCase>(
        () async => _i243.LoginUseCase(repo: await getAsync<_i292.AuthRepo>()));
    await gh.factoryAsync<_i270.LoginCubit>(
      () async =>
          _i270.LoginCubit(loginUseCase: await getAsync<_i243.LoginUseCase>()),
      preResolve: true,
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
