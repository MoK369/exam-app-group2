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

import '../dio_service/dio_service.dart' as _i73;
import '../localization/l10n_manager/localization_manager.dart' as _i141;
import '../modules/authentication/data/api_manager/api_manager.dart' as _i750;
import '../modules/authentication/data/data_sources_contracts/sign_up/sign_up_remote_data_source.dart'
    as _i822;
import '../modules/authentication/data/data_sources_imp/sign_up/sign_up_data_source_imp.dart'
    as _i790;
import '../modules/authentication/data/repositories_imp/sign_up/sign_up_repository_imp.dart'
    as _i983;
import '../modules/authentication/domain/repositories_constracts/sign_up/sign_up_repository.dart'
    as _i698;
import '../modules/authentication/domain/use_cases/localization/localization_use_case.dart'
    as _i888;
import '../modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart'
    as _i816;
import '../modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart'
    as _i663;

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
    gh.factory<_i750.ApiManager>(() => _i750.ApiManager());
    gh.singleton<_i361.Dio>(() => dioService.provideDio());
    gh.singleton<_i141.LocalizationManager>(() => _i141.LocalizationManager());
    gh.factory<_i822.SignUpRemoteDataSource>(() =>
        _i790.SignUpRemoteDataSourceImp(apiManager: gh<_i750.ApiManager>()));
    gh.factory<_i698.SignUpRepository>(() => _i983.SignUpRepositoryImp(
        signUpRemoteDataSource: gh<_i822.SignUpRemoteDataSource>()));
    gh.factory<_i888.LocalizationUseCase>(
        () => _i888.LocalizationUseCase(gh<_i141.LocalizationManager>()));
    gh.factory<_i816.SignUpUseCase>(() =>
        _i816.SignUpUseCase(signUpRepository: gh<_i698.SignUpRepository>()));
    gh.factory<_i663.SignUpViewModel>(
        () => _i663.SignUpViewModel(gh<_i816.SignUpUseCase>()));
    return this;
  }
}

class _$DioService extends _i73.DioService {}
