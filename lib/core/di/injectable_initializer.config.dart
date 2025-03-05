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
import '../../localization/initializer/locale_initializer.dart' as _i852;
import '../../localization/l10n_manager/localization_manager.dart' as _i375;
import '../../localization/use_case/localization_use_case.dart' as _i964;
import '../../modules/authentication/data/api_manager/auth_api_manager.dart'
as _i208;
import '../../modules/authentication/data/data_sources_contracts/auth_local_datasource.dart'
as _i74;
import '../../modules/authentication/data/data_sources_contracts/login/login_remote_datasource.dart'
as _i422;
import '../../modules/authentication/data/data_sources_contracts/sign_up/sign_up_remote_data_source.dart'
as _i186;
import '../../modules/authentication/data/data_sources_imp/auth_local_datasource_impl.dart'
as _i907;
import '../../modules/authentication/data/data_sources_imp/login/login_remote_data_source_impl.dart'
as _i712;
import '../../modules/authentication/data/data_sources_imp/sign_up/sign_up_data_source_imp.dart'
as _i522;
import '../../modules/authentication/data/repositories_imp/login/login_repo_impl.dart'
as _i914;
import '../../modules/authentication/data/repositories_imp/sign_up/sign_up_repository_imp.dart'
as _i1059;
import '../../modules/authentication/domain/repositories_contracts/login/login_repo.dart'
as _i450;
import '../../modules/authentication/domain/repositories_contracts/sign_up/sign_up_repository.dart'
as _i1011;
import '../../modules/authentication/domain/use_cases/login/login_use_case.dart'
as _i543;
import '../../modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart'
as _i367;
import '../../modules/authentication/ui/login/view_model/login_view_model.dart'
as _i108;
import '../../modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart'
as _i399;
import '../../modules/edit_profile/view_model/edit_profile_screen_view_model.dart'
as _i1011;
import '../../modules/home/UI/layouts/profile_layout/view_model/profile_view_model.dart'
as _i1063;
import '../../modules/home/UI/layouts/settings_layout/view_model/settings_view_model.dart'
as _i203;
import '../../modules/home/UI/view_model/home_view_model.dart' as _i907;
import '../../modules/home/data/api/api_client/home_api_client.dart' as _i293;
import '../../modules/home/data/api/api_client_provider/home_api_client_provider.dart'
as _i939;
import '../../modules/home/data/api_manager/home_api_manager.dart' as _i945;
import '../../modules/home/data/data_source_contracts/delete_account/delete_account_remote_data_source.dart'
as _i747;
import '../../modules/home/data/data_source_contracts/logout/logout_remote_data_source.dart'
as _i691;
import '../../modules/home/data/data_source_contracts/logout_delete_account_local_data_source.dart'
as _i771;
import '../../modules/home/data/data_source_imp/delete_account/delete_account_remote_data_source_imp.dart'
as _i100;
import '../../modules/home/data/data_source_imp/logout/logout_remote_data_source_imp.dart'
as _i111;
import '../../modules/home/data/data_source_imp/logout_delete_account_local_data_source_imp.dart'
as _i993;
import '../../modules/home/data/repository_imp/delete_account/delete_account_repository_imp.dart'
as _i813;
import '../../modules/home/data/repository_imp/logout/logout_repository_imp.dart'
as _i976;
import '../../modules/home/domain/repositories_contracts/delete_account/delete_account_repository.dart'
as _i1062;
import '../../modules/home/domain/repositories_contracts/logout/logout_repository.dart'
as _i936;
import '../../modules/home/domain/use_cases/delete_account/delete_account_use_case.dart'
as _i443;
import '../../modules/home/domain/use_cases/logout/logout_use_case.dart'
as _i142t/view_model/settings_view_model.dart'
    as _i203;
import '../../modules/home/UI/view_model/home_view_model.dart' as _i907;
import '../../modules/reset_password/view_model/reset_password_screen_view_model.dart'
    as _i749;
import '../../storage/contracts/storage_service_contract.dart' as _i70;
import '../../storage/implementation/storage_service_imp.dart' as _i622;
import '../../storage/initializer/storage_initializer.dart' as _i661;
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
    final homeApiClientProvider = _$HomeApiClientProvider();
    final localeInitializer = _$LocaleInitializer();
    gh.factory<_i1063.ProfileViewModel>(() => _i1063.ProfileViewModel());
    gh.factory<_i907.HomeViewModel>(() => _i907.HomeViewModel());
    gh.factory<_i1011.EditProfileScreenViewModel>(
        () => _i1011.EditProfileScreenViewModel());
    gh.factory<_i749.ResetPasswordScreenViewModel>(
        () => _i749.ResetPasswordScreenViewModel());
    await gh.factoryAsync<_i558.FlutterSecureStorage>(
      () => storageInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    await gh.factoryAsync<_i361.Dio>(
      () => dioService.provideDio(),
      preResolve: true,
    );
    gh.singleton<_i393.ErrorNotifier>(() => _i393.ErrorNotifier());
    gh.lazySingleton<_i945.HomeApiManager>(() => _i945.HomeApiManager());
    gh.lazySingleton<_i208.AuthApiManager>(() => _i208.AuthApiManager());
    gh.factory<_i186.SignUpRemoteDataSource>(() =>
        _i522.SignUpRemoteDataSourceImp(
            apiManager: gh<_i208.AuthApiManager>()));
    gh.singleton<_i293.HomeApiClient>(
        () => homeApiClientProvider.provideApiClient(gh<_i361.Dio>()));
    gh.factory<_i422.LoginRemoteDataSource>(() =>
        _i712.LoginRemoteDataSourceImpl(
            apiManager: gh<_i208.AuthApiManager>()));
    gh.factory<_i747.DeleteAccountRemoteDataSource>(() =>
        _i100.DeleteAccountRemoteDataSourceImp(gh<_i293.HomeApiClient>()));
    gh.singleton<_i70.StorageService<_i558.FlutterSecureStorage>>(
        () => _i622.StorageServiceImp(
              gh<_i393.ErrorNotifier>(),
              gh<_i558.FlutterSecureStorage>(),
            ));
    await gh.factoryAsync<String>(
      () => localeInitializer.initCurrentLocal(
          gh<_i70.StorageService<_i558.FlutterSecureStorage>>()),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    gh.factory<_i771.LogoutDeleteAccountLocalDataSource>(() =>
        _i993.LogoutDeleteAccountLocalDataSourceImp(
            gh<_i70.StorageService<_i558.FlutterSecureStorage>>()));
    gh.factory<_i691.LogoutRemoteDataSource>(
        () => _i111.LogoutRemoteDataSourceImp(
              gh<_i293.HomeApiClient>(),
              gh<_i70.StorageService<_i558.FlutterSecureStorage>>(),
            ));
    gh.factory<_i1062.DeleteAccountRepository>(
        () => _i813.DeleteAccountRepositoryImp(
              gh<_i747.DeleteAccountRemoteDataSource>(),
              gh<_i771.LogoutDeleteAccountLocalDataSource>(),
            ));
    gh.factory<_i1011.SignUpRepository>(() => _i1059.SignUpRepositoryImp(
        signUpRemoteDataSource: gh<_i186.SignUpRemoteDataSource>()));
    gh.singleton<_i375.LocalizationManager>(() => _i375.LocalizationManager(
          gh<_i70.StorageService<_i558.FlutterSecureStorage>>(),
          gh<String>(instanceName: 'initCurrentLocal'),
        ));
    gh.factory<_i74.AuthLocalDataSource>(() => _i907.AuthLocalDataSourceImpl(
        storageService: gh<_i70.StorageService<_i558.FlutterSecureStorage>>()));
    gh.factory<_i936.LogoutRepository>(() => _i976.LogoutRepositoryImp(
          gh<_i691.LogoutRemoteDataSource>(),
          gh<_i771.LogoutDeleteAccountLocalDataSource>(),
        ));
    gh.factory<_i142.LogoutUseCase>(
        () => _i142.LogoutUseCase(gh<_i936.LogoutRepository>()));
    gh.factory<_i367.SignUpUseCase>(() =>
        _i367.SignUpUseCase(signUpRepository: gh<_i1011.SignUpRepository>()));
    gh.factory<_i399.SignUpViewModel>(
        () => _i399.SignUpViewModel(gh<_i367.SignUpUseCase>()));
    gh.factory<_i443.DeleteAccountUseCase>(
        () => _i443.DeleteAccountUseCase(gh<_i1062.DeleteAccountRepository>()));
    gh.factory<_i964.LocalizationUseCase>(
        () => _i964.LocalizationUseCase(gh<_i375.LocalizationManager>()));
    gh.factory<_i450.LoginRepo>(() => _i914.LoginRepoImpl(
          authRemoteDataSource: gh<_i422.LoginRemoteDataSource>(),
          authLocalDataSource: gh<_i74.AuthLocalDataSource>(),
        ));
    gh.factory<_i543.LoginUseCase>(
        () => _i543.LoginUseCase(authRepo: gh<_i450.LoginRepo>()));
    gh.factory<_i108.LoginViewModel>(
        () => _i108.LoginViewModel(loginUseCase: gh<_i543.LoginUseCase>()));
    gh.factory<_i203.SettingsViewModel>(() => _i203.SettingsViewModel(
          gh<_i142.LogoutUseCase>(),
          gh<_i443.DeleteAccountUseCase>(),
        ));
    return this;
  }
}

class _$StorageInitializer extends _i661.StorageInitializer {}

class _$DioService extends _i678.DioService {}

class _$HomeApiClientProvider extends _i939.HomeApiClientProvider {}

class _$LocaleInitializer extends _i852.LocaleInitializer {}
