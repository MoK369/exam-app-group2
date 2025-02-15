// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../modules/authentication/data/api/api_manager.dart' as _i920;
import '../../modules/authentication/data/datasource_contract/auth_datasource.dart'
    as _i978;
import '../../modules/authentication/data/datasource_impl/auth_data_source_impl.dart'
    as _i1021;
import '../../modules/authentication/data/repo_impl/auth_repo_impl.dart'
    as _i869;
import '../../modules/authentication/domain/repo_contract/auth_repo.dart'
    as _i292;
import '../../modules/authentication/domain/usecases/login_use_case.dart'
    as _i243;
import '../../modules/authentication/screens/login/viewModel/login_cubit.dart'
    as _i803;

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
    gh.singleton<_i920.ApiManager>(() => _i920.ApiManager());
    gh.factory<_i978.AuthDataSource>(
        () => _i1021.AuthDataSourceImpl(apiManager: gh<_i920.ApiManager>()));
    gh.factory<_i292.AuthRepo>(
        () => _i869.AuthRepoImpl(authDataSource: gh<_i978.AuthDataSource>()));
    gh.factory<_i243.LoginUseCase>(
        () => _i243.LoginUseCase(repo: gh<_i292.AuthRepo>()));
    gh.factory<_i803.LoginCubit>(
        () => _i803.LoginCubit(loginUseCase: gh<_i243.LoginUseCase>()));
    return this;
  }
}
