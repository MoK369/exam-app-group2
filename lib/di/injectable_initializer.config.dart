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
import '../modules/authentication/domain/use_cases/localization/localization_use_case.dart'
    as _i888;
import '../modules/forget%20password/data/api/api_manager.dart' as _i588;
import '../modules/forget%20password/data/datasource_contract/forget_password_remote_datasource.dart'
    as _i463;
import '../modules/forget%20password/data/datasource_contract/reset_password_remote_datasource.dart'
    as _i202;
import '../modules/forget%20password/data/datasource_contract/verfy_code_remote_datasource.dart'
    as _i387;
import '../modules/forget%20password/data/datasource_imp/forget_password_remote_datasource_imp.dart'
    as _i422;
import '../modules/forget%20password/data/datasource_imp/reset_password_remote_datasource_imp.dart'
    as _i967;
import '../modules/forget%20password/data/datasource_imp/verfy_code_remote_datasource_imp.dart'
    as _i721;
import '../modules/forget%20password/data/repo_impl/forget_password_repo_imp.dart'
    as _i356;
import '../modules/forget%20password/data/repo_impl/reset_password_repo_imp.dart'
    as _i799;
import '../modules/forget%20password/data/repo_impl/verfy_code_repo_imp.dart'
    as _i1;
import '../modules/forget%20password/domain/repo_contract/forget_password_repo.dart'
    as _i905;
import '../modules/forget%20password/domain/repo_contract/reset_password_repo.dart'
    as _i515;
import '../modules/forget%20password/domain/repo_contract/verfy_code_repo.dart'
    as _i152;
import '../modules/forget%20password/domain/usecases/forget_password_usecase.dart'
    as _i627;
import '../modules/forget%20password/domain/usecases/reset_password_usecase.dart'
    as _i242;
import '../modules/forget%20password/domain/usecases/verfy_code_usecase.dart'
    as _i1057;
import '../modules/forget%20password/screens/view%20model/forget_password_cubit.dart'
    as _i228;
import '../modules/forget%20password/screens/view%20model/reset%20password%20cubit/reset_password_cubit.dart'
    as _i151;
import '../modules/forget%20password/screens/view%20model/verfy%20code%20cubit/verfy_code_cubit.dart'
    as _i270;

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
    gh.singleton<_i361.Dio>(() => dioService.provideDio());
    gh.singleton<_i141.LocalizationManager>(() => _i141.LocalizationManager());
    gh.singleton<_i588.ForgotPasswordApiManager>(
        () => _i588.ForgotPasswordApiManager());
    gh.factory<_i750.ApiManager>(() => _i750.ApiManager(gh<_i73.DioService>()));
    gh.factory<_i387.VerfyCodeRemoteDatasource>(() =>
        _i721.VerfyCodeRemoteDatasourceImp(
            apiManager: gh<_i588.ForgotPasswordApiManager>()));
    gh.factory<_i888.LocalizationUseCase>(
        () => _i888.LocalizationUseCase(gh<_i141.LocalizationManager>()));
    gh.factory<_i463.ForgetPasswordRemoteDatasource>(() =>
        _i422.ForgetPasswordRemoteDatasourceImp(
            apiManager: gh<_i588.ForgotPasswordApiManager>()));
    gh.factory<_i152.VerfyCodeRepo>(() => _i1.VerfyCodeRepoImp(
        verfyCodeRemoteDatasource: gh<_i387.VerfyCodeRemoteDatasource>()));
    gh.factory<_i202.ResetPasswordRemoteDataSource>(() =>
        _i967.ResetPasswordRemoteDatasourceImp(
            apiManager: gh<_i588.ForgotPasswordApiManager>()));
    gh.factory<_i905.ForgetPasswordRepo>(() => _i356.ForgetPasswordRepoImp(
        forgetPasswordRemoteDatasource:
            gh<_i463.ForgetPasswordRemoteDatasource>()));
    gh.factory<_i515.ResetPasswordRepo>(() => _i799.ResetPasswordRepoImp(
        resetPasswordRemoteDataSource:
            gh<_i202.ResetPasswordRemoteDataSource>()));
    gh.factory<_i1057.VerfyCodeUsecase>(() =>
        _i1057.VerfyCodeUsecase(verfyCodeRepo: gh<_i152.VerfyCodeRepo>()));
    gh.factory<_i627.ForgetPasswordUsecase>(() => _i627.ForgetPasswordUsecase(
        forgetPasswordRepo: gh<_i905.ForgetPasswordRepo>()));
    gh.factory<_i228.ForgotPasswordCubit>(() => _i228.ForgotPasswordCubit(
        forgotPasswordUseCase: gh<_i627.ForgetPasswordUsecase>()));
    gh.factory<_i270.VerfyCodeCubit>(() =>
        _i270.VerfyCodeCubit(verfyCodeUsecase: gh<_i1057.VerfyCodeUsecase>()));
    gh.factory<_i242.ResetPasswordUsecase>(() => _i242.ResetPasswordUsecase(
        resetPasswordRepo: gh<_i515.ResetPasswordRepo>()));
    gh.factory<_i151.ResetPasswordCubit>(() => _i151.ResetPasswordCubit(
        resetPasswordUsecase: gh<_i242.ResetPasswordUsecase>()));
    return this;
  }
}

class _$DioService extends _i73.DioService {}
