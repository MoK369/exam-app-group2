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
import '../localization/use_case/localization_use_case.dart' as _i451;
import '../modules/authentication/data/api/api_manager.dart' as _i157;
import '../modules/authentication/data/datasource_contract/forget_password_remote_datasource.dart'
    as _i770;
import '../modules/authentication/data/datasource_contract/reset_password_remote_datasource.dart'
    as _i152;
import '../modules/authentication/data/datasource_contract/verfy_code_remote_datasource.dart'
    as _i263;
import '../modules/authentication/data/datasource_imp/forget_password_remote_datasource_imp.dart'
    as _i170;
import '../modules/authentication/data/datasource_imp/reset_password_remote_datasource_imp.dart'
    as _i354;
import '../modules/authentication/data/datasource_imp/verfy_code_remote_datasource_imp.dart'
    as _i466;
import '../modules/authentication/data/repo_impl/forget_password_repo_imp.dart'
    as _i859;
import '../modules/authentication/data/repo_impl/reset_password_repo_imp.dart'
    as _i468;
import '../modules/authentication/data/repo_impl/verfy_code_repo_imp.dart'
    as _i4;
import '../modules/authentication/domain/repo_contract/forget_password_repo.dart'
    as _i125;
import '../modules/authentication/domain/repo_contract/reset_password_repo.dart'
    as _i476;
import '../modules/authentication/domain/repo_contract/verfy_code_repo.dart'
    as _i959;
import '../modules/authentication/domain/usecases/forget_password_usecase.dart'
    as _i474;
import '../modules/authentication/domain/usecases/reset_password_usecase.dart'
    as _i778;
import '../modules/authentication/domain/usecases/verfy_code_usecase.dart'
    as _i900;
import '../modules/authentication/ui/forget_password/layouts/confirm_password_layout/view_model/reset_password_cubit.dart'
    as _i83;
import '../modules/authentication/ui/forget_password/layouts/forget_password_layout/view_model/forget_password_cubit.dart'
    as _i553;
import '../modules/authentication/ui/forget_password/layouts/verify_email_layout/view_model/verify_email_cubit.dart'
    as _i954;

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
    final dioService = _$DioService();
    await gh.factoryAsync<_i361.Dio>(
      () => dioService.provideDio(),
      preResolve: true,
    );
    gh.singleton<_i157.ForgotPasswordApiManager>(
        () => _i157.ForgotPasswordApiManager());
    gh.singleton<_i141.LocalizationManager>(() => _i141.LocalizationManager());
    gh.factory<_i263.VerifyCodeRemoteDatasource>(() =>
        _i466.VerifyCodeRemoteDatasourceImp(
            apiManager: gh<_i157.ForgotPasswordApiManager>()));
    gh.factory<_i770.ForgetPasswordRemoteDatasource>(() =>
        _i170.ForgetPasswordRemoteDatasourceImp(
            apiManager: gh<_i157.ForgotPasswordApiManager>()));
    gh.factory<_i125.ForgetPasswordRepo>(() => _i859.ForgetPasswordRepoImp(
        forgetPasswordRemoteDatasource:
            gh<_i770.ForgetPasswordRemoteDatasource>()));
    gh.factory<_i152.ResetPasswordRemoteDataSource>(() =>
        _i354.ResetPasswordRemoteDatasourceImp(
            apiManager: gh<_i157.ForgotPasswordApiManager>()));
    gh.factory<_i476.ResetPasswordRepo>(() => _i468.ResetPasswordRepoImp(
        resetPasswordRemoteDataSource:
            gh<_i152.ResetPasswordRemoteDataSource>()));
    gh.factory<_i778.ResetPasswordUseCase>(() => _i778.ResetPasswordUseCase(
        resetPasswordRepo: gh<_i476.ResetPasswordRepo>()));
    gh.factory<_i451.LocalizationUseCase>(
        () => _i451.LocalizationUseCase(gh<_i141.LocalizationManager>()));
    gh.factory<_i83.ResetPasswordCubit>(() => _i83.ResetPasswordCubit(
        resetPasswordUseCase: gh<_i778.ResetPasswordUseCase>()));
    gh.factory<_i474.ForgetPasswordUseCase>(() => _i474.ForgetPasswordUseCase(
        forgetPasswordRepo: gh<_i125.ForgetPasswordRepo>()));
    gh.factory<_i553.ForgetPasswordCubit>(() => _i553.ForgetPasswordCubit(
        forgetPasswordUseCase: gh<_i474.ForgetPasswordUseCase>()));
    gh.factory<_i959.VerifyCodeRepo>(() => _i4.VerifyCodeRepoImp(
        verifyCodeRemoteDatasource: gh<_i263.VerifyCodeRemoteDatasource>()));
    gh.factory<_i900.VerifyCodeUseSase>(() =>
        _i900.VerifyCodeUseSase(verifyCodeRepo: gh<_i959.VerifyCodeRepo>()));
    gh.factory<_i954.VerifyEmailCubit>(() => _i954.VerifyEmailCubit(
          verifyCodeUseCase: gh<_i900.VerifyCodeUseSase>(),
          forgetPasswordUseCase: gh<_i474.ForgetPasswordUseCase>(),
        ));
    return this;
  }
}

class _$DioService extends _i73.DioService {}
