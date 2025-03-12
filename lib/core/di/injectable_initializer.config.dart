// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i13;

import '../../dio_service/dio_service.dart' as _i72;
import '../../image_picking/contracts/image_picking_service_contract.dart'
    as _i51;
import '../../image_picking/image_picker_provider/image_picker_provider.dart'
    as _i76;
import '../../image_picking/implementation/image_picking_service_imp.dart'
    as _i52;
import '../../localization/initializer/locale_initializer.dart' as _i77;
import '../../localization/l10n_manager/localization_manager.dart' as _i53;
import '../../localization/use_case/localization_use_case.dart' as _i54;
import '../../modules/authentication/data/api_manager/auth_api_manager.dart'
    as _i3;
import '../../modules/authentication/data/data_sources_contracts/auth_local_datasource.dart'
    as _i33;
import '../../modules/authentication/data/data_sources_contracts/login/login_remote_datasource.dart'
    as _i21;
import '../../modules/authentication/data/data_sources_contracts/sign_up/sign_up_remote_data_source.dart'
    as _i25;
import '../../modules/authentication/data/data_sources_imp/auth_local_datasource_impl.dart'
    as _i34;
import '../../modules/authentication/data/data_sources_imp/login/login_remote_data_source_impl.dart'
    as _i22;
import '../../modules/authentication/data/data_sources_imp/sign_up/sign_up_data_source_imp.dart'
    as _i26;
import '../../modules/authentication/data/repositories_imp/login/login_repo_impl.dart'
    as _i56;
import '../../modules/authentication/data/repositories_imp/sign_up/sign_up_repository_imp.dart'
    as _i28;
import '../../modules/authentication/domain/repositories_contracts/login/login_repo.dart'
    as _i55;
import '../../modules/authentication/domain/repositories_contracts/sign_up/sign_up_repository.dart'
    as _i27;
import '../../modules/authentication/domain/use_cases/login/login_use_case.dart'
    as _i57;
import '../../modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart'
    as _i29;
import '../../modules/authentication/ui/login/view_model/login_view_model.dart'
    as _i58;
import '../../modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart'
    as _i30;
import '../../modules/change_password/data/api/api_client/change_password_api_client.dart'
    as _i35;
import '../../modules/change_password/data/api/api_client_provider/change_password_api_client_provider.dart'
    as _i78;
import '../../modules/change_password/data/data_source_contracts/change_password/change_password_local_data_source.dart'
    as _i36;
import '../../modules/change_password/data/data_source_contracts/change_password/change_password_remote_data_source.dart'
    as _i38;
import '../../modules/change_password/data/data_source_imps/change_password/change_password_local_data_source_imp.dart'
    as _i37;
import '../../modules/change_password/data/data_source_imps/change_password/change_password_remote_data_source_imp.dart'
    as _i39;
import '../../modules/change_password/data/repositories_imp/change_password/change_password_repository_imp.dart'
    as _i41;
import '../../modules/change_password/domain/repositories_contracts/change_password/change_password_repository.dart'
    as _i40;
import '../../modules/change_password/domain/use_cases/change_password/change_password_use_case.dart'
    as _i42;
import '../../modules/change_password/ui/view_model/change_password_screen_view_model.dart'
    as _i65;
import '../../modules/edit_profile/data/api/api_client/edit_profile_api_client.dart'
    as _i5;
import '../../modules/edit_profile/data/api/api_client_provider/edit_profile_api_client_provider.dart'
    as _i73;
import '../../modules/edit_profile/data/data_source_contracts/edit_profile/edit_profile_local_data_source.dart'
    as _i45;
import '../../modules/edit_profile/data/data_source_contracts/edit_profile/edit_profile_remote_data_source.dart'
    as _i6;
import '../../modules/edit_profile/data/data_source_imps/edit_profile/edit_profile_local_data_source_imp.dart'
    as _i46;
import '../../modules/edit_profile/data/data_source_imps/edit_profile/edit_profile_remote_data_source_imp.dart'
    as _i7;
import '../../modules/edit_profile/data/repositories_imp/edit_profile/edit_profile_repository_imp.dart'
    as _i48;
import '../../modules/edit_profile/domain/entities/image_entity/image_entity.dart'
    as _i15;
import '../../modules/edit_profile/domain/repositories_contracts/edit_profile/edit_profile_repository.dart'
    as _i47;
import '../../modules/edit_profile/domain/use_cases/edit_profile/edit_profile_use_case.dart'
    as _i49;
import '../../modules/edit_profile/ui/view_model/edit_profile_screen_view_model.dart'
    as _i69;
import '../../modules/home/UI/layouts/profile_layout/view_model/profile_view_model.dart'
    as _i64;
import '../../modules/home/UI/layouts/settings_layout/view_model/settings_view_model.dart'
    as _i71;
import '../../modules/home/UI/view_model/home_view_model.dart' as _i70;
import '../../modules/home/data/api/api_client/home_api_client.dart' as _i10;
import '../../modules/home/data/api/api_client_provider/home_api_client_provider.dart'
    as _i75;
import '../../modules/home/data/api_manager/home_api_manager.dart' as _i11;
import '../../modules/home/data/data_source_contracts/delete_account/delete_account_remote_data_source.dart'
    as _i43;
import '../../modules/home/data/data_source_contracts/get_logged_user_info/logged_user_info_remote_data_source.dart'
    as _i17;
import '../../modules/home/data/data_source_contracts/logout/logout_remote_data_source.dart'
    as _i23;
import '../../modules/home/data/data_source_contracts/logout_delete_account_local_data_source.dart'
    as _i59;
import '../../modules/home/data/data_source_imp/delete_account/delete_account_remote_data_source_imp.dart'
    as _i44;
import '../../modules/home/data/data_source_imp/get_logged_user_info/logged_user_info_remote_data_source_imp.dart'
    as _i18;
import '../../modules/home/data/data_source_imp/logout/logout_remote_data_source_imp.dart'
    as _i24;
import '../../modules/home/data/data_source_imp/logout_delete_account_local_data_source_imp.dart'
    as _i60;
import '../../modules/home/data/repository_imp/delete_account/delete_account_repository_imp.dart'
    as _i67;
import '../../modules/home/data/repository_imp/get_logged_user_info/logged_user_info_repository_imp.dart'
    as _i20;
import '../../modules/home/data/repository_imp/logout/logout_repository_imp.dart'
    as _i62;
import '../../modules/home/domain/repositories_contracts/delete_account/delete_account_repository.dart'
    as _i66;
import '../../modules/home/domain/repositories_contracts/get_logged_user_info/logged_user_info_repository.dart'
    as _i19;
import '../../modules/home/domain/repositories_contracts/logout/logout_repository.dart'
    as _i61;
import '../../modules/home/domain/use_cases/delete_account/delete_account_use_case.dart'
    as _i68;
import '../../modules/home/domain/use_cases/get_logged_user_info/get_logged_user_info_use_case.dart'
    as _i50;
import '../../modules/home/domain/use_cases/logout/logout_use_case.dart'
    as _i63;
import '../../storage/contracts/isar_storage_service_contract.dart' as _i14;
import '../../storage/contracts/storage_service_contract.dart' as _i31;
import '../../storage/implementation/isar_storage_service_image_entity_imp.dart'
    as _i16;
import '../../storage/implementation/storage_service_imp.dart' as _i32;
import '../../storage/initializer/storage_initializer.dart' as _i74;
import '../providers/error/error_notifier.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioService = _$DioService();
    final editProfileApiClientProvider = _$EditProfileApiClientProvider();
    final storageInitializer = _$StorageInitializer();
    final homeApiClientProvider = _$HomeApiClientProvider();
    final imagePickerProvider = _$ImagePickerProvider();
    final localeInitializer = _$LocaleInitializer();
    final changePasswordApiClientProvider = _$ChangePasswordApiClientProvider();
    gh.lazySingleton<_i3.AuthApiManager>(() => _i3.AuthApiManager());
    await gh.factoryAsync<_i4.Dio>(
      () => dioService.provideDio(),
      preResolve: true,
    );
    gh.factory<_i5.EditProfileApiClient>(
        () => editProfileApiClientProvider.provideApiClient(gh<_i4.Dio>()));
    gh.factory<_i6.EditProfileRemoteDataSource>(() =>
        _i7.EditProfileRemoteDataSourceImp(gh<_i5.EditProfileApiClient>()));
    gh.lazySingleton<_i8.ErrorNotifier>(() => _i8.ErrorNotifier());
    await gh.factoryAsync<_i9.FlutterSecureStorage>(
      () => storageInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    gh.singleton<_i10.HomeApiClient>(
        () => homeApiClientProvider.provideApiClient(gh<_i4.Dio>()));
    gh.lazySingleton<_i11.HomeApiManager>(() => _i11.HomeApiManager());
    gh.lazySingleton<_i12.ImagePicker>(
        () => imagePickerProvider.providerInstance());
    await gh.factoryAsync<_i13.Isar>(
      () => storageInitializer.initIsarInstance(),
      preResolve: true,
    );
    gh.factory<_i14.IsarStorageService<_i15.ImageEntity>>(
        () => _i16.IsarStorageServiceQuestionEntityImp(gh<_i13.Isar>()));
    gh.factory<_i17.LoggedUserInfoRemoteDataSource>(
        () => _i18.LoggedUserInfoRemoteDataSourceImp(gh<_i10.HomeApiClient>()));
    gh.factory<_i19.LoggedUserInfoRepository>(() =>
        _i20.LoggedUserInfoRepositoryImp(
            gh<_i17.LoggedUserInfoRemoteDataSource>()));
    gh.factory<_i21.LoginRemoteDataSource>(() =>
        _i22.LoginRemoteDataSourceImpl(apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i23.LogoutRemoteDataSource>(
        () => _i24.LogoutRemoteDataSourceImp(gh<_i10.HomeApiClient>()));
    gh.factory<_i25.SignUpRemoteDataSource>(() =>
        _i26.SignUpRemoteDataSourceImp(apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i27.SignUpRepository>(() => _i28.SignUpRepositoryImp(
        signUpRemoteDataSource: gh<_i25.SignUpRemoteDataSource>()));
    gh.factory<_i29.SignUpUseCase>(() =>
        _i29.SignUpUseCase(signUpRepository: gh<_i27.SignUpRepository>()));
    gh.factory<_i30.SignUpViewModel>(
        () => _i30.SignUpViewModel(gh<_i29.SignUpUseCase>()));
    gh.singleton<_i31.StorageService<_i9.FlutterSecureStorage>>(
        () => _i32.StorageServiceImp(
              gh<_i8.ErrorNotifier>(),
              gh<_i9.FlutterSecureStorage>(),
            ));
    await gh.factoryAsync<String>(
      () => localeInitializer.initCurrentLocal(
          gh<_i31.StorageService<_i9.FlutterSecureStorage>>()),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    gh.factory<_i33.AuthLocalDataSource>(() => _i34.AuthLocalDataSourceImpl(
        storageService: gh<_i31.StorageService<_i9.FlutterSecureStorage>>()));
    gh.factory<_i35.ChangePasswordApiClient>(
        () => changePasswordApiClientProvider.provideClient(gh<_i4.Dio>()));
    gh.factory<_i36.ChangePasswordLocalDataSource>(() =>
        _i37.ChangePasswordLocalDataSourceImp(
            gh<_i31.StorageService<_i9.FlutterSecureStorage>>()));
    gh.factory<_i38.ChangePasswordRemoteDataSource>(() =>
        _i39.ChangePasswordRemoteDataSourceImp(
            gh<_i35.ChangePasswordApiClient>()));
    gh.factory<_i40.ChangePasswordRepository>(
        () => _i41.ChangePasswordRepositoryImp(
              gh<_i38.ChangePasswordRemoteDataSource>(),
              gh<_i36.ChangePasswordLocalDataSource>(),
            ));
    gh.factory<_i42.ChangePasswordUseCase>(
        () => _i42.ChangePasswordUseCase(gh<_i40.ChangePasswordRepository>()));
    gh.factory<_i43.DeleteAccountRemoteDataSource>(
        () => _i44.DeleteAccountRemoteDataSourceImp(gh<_i10.HomeApiClient>()));
    gh.factory<_i45.EditProfileLocalDataSource>(() =>
        _i46.EditProfileLocalDataSourceImp(
            gh<_i31.StorageService<_i9.FlutterSecureStorage>>()));
    gh.factory<_i47.EditProfileRepository>(() => _i48.EditProfileRepositoryImp(
          gh<_i6.EditProfileRemoteDataSource>(),
          gh<_i45.EditProfileLocalDataSource>(),
        ));
    gh.factory<_i49.EditProfileUseCase>(
        () => _i49.EditProfileUseCase(gh<_i47.EditProfileRepository>()));
    gh.factory<_i50.GetLoggedUserInfoUseCase>(() =>
        _i50.GetLoggedUserInfoUseCase(gh<_i19.LoggedUserInfoRepository>()));
    gh.factory<_i51.ImagePickingService>(() => _i52.ImagePickingServiceImp(
          gh<_i12.ImagePicker>(),
          gh<_i8.ErrorNotifier>(),
          gh<_i14.IsarStorageService<_i15.ImageEntity>>(),
        ));
    gh.singleton<_i53.LocalizationManager>(() => _i53.LocalizationManager(
          gh<_i31.StorageService<_i9.FlutterSecureStorage>>(),
          gh<String>(instanceName: 'initCurrentLocal'),
        ));
    gh.factory<_i54.LocalizationUseCase>(
        () => _i54.LocalizationUseCase(gh<_i53.LocalizationManager>()));
    gh.factory<_i55.LoginRepo>(() => _i56.LoginRepoImpl(
          authRemoteDataSource: gh<_i21.LoginRemoteDataSource>(),
          authLocalDataSource: gh<_i33.AuthLocalDataSource>(),
        ));
    gh.factory<_i57.LoginUseCase>(
        () => _i57.LoginUseCase(authRepo: gh<_i55.LoginRepo>()));
    gh.factory<_i58.LoginViewModel>(
        () => _i58.LoginViewModel(loginUseCase: gh<_i57.LoginUseCase>()));
    gh.factory<_i59.LogoutDeleteAccountLocalDataSource>(() =>
        _i60.LogoutDeleteAccountLocalDataSourceImp(
            gh<_i31.StorageService<_i9.FlutterSecureStorage>>()));
    gh.factory<_i61.LogoutRepository>(() => _i62.LogoutRepositoryImp(
          gh<_i23.LogoutRemoteDataSource>(),
          gh<_i59.LogoutDeleteAccountLocalDataSource>(),
        ));
    gh.factory<_i63.LogoutUseCase>(
        () => _i63.LogoutUseCase(gh<_i61.LogoutRepository>()));
    gh.factory<_i64.ProfileViewModel>(() => _i64.ProfileViewModel(
          gh<_i50.GetLoggedUserInfoUseCase>(),
          gh<_i51.ImagePickingService>(),
        ));
    gh.factory<_i65.ChangePasswordScreenViewModel>(() =>
        _i65.ChangePasswordScreenViewModel(gh<_i42.ChangePasswordUseCase>()));
    gh.factory<_i66.DeleteAccountRepository>(
        () => _i67.DeleteAccountRepositoryImp(
              gh<_i43.DeleteAccountRemoteDataSource>(),
              gh<_i59.LogoutDeleteAccountLocalDataSource>(),
            ));
    gh.factory<_i68.DeleteAccountUseCase>(
        () => _i68.DeleteAccountUseCase(gh<_i66.DeleteAccountRepository>()));
    gh.factory<_i69.EditProfileScreenViewModel>(
        () => _i69.EditProfileScreenViewModel(
              gh<_i49.EditProfileUseCase>(),
              gh<_i51.ImagePickingService>(),
            ));
    gh.factory<_i70.HomeViewModel>(
        () => _i70.HomeViewModel(gh<_i51.ImagePickingService>()));
    gh.factory<_i71.SettingsViewModel>(() => _i71.SettingsViewModel(
          gh<_i63.LogoutUseCase>(),
          gh<_i68.DeleteAccountUseCase>(),
        ));
    return this;
  }
}

class _$DioService extends _i72.DioService {}

class _$EditProfileApiClientProvider
    extends _i73.EditProfileApiClientProvider {}

class _$StorageInitializer extends _i74.StorageInitializer {}

class _$HomeApiClientProvider extends _i75.HomeApiClientProvider {}

class _$ImagePickerProvider extends _i76.ImagePickerProvider {}

class _$LocaleInitializer extends _i77.LocaleInitializer {}

class _$ChangePasswordApiClientProvider
    extends _i78.ChangePasswordApiClientProvider {}
