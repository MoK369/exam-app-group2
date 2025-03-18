// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i20;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i21;

import '../../dio_service/dio_service.dart' as _i110;
import '../../image_picking/contracts/image_picking_service_contract.dart'
    as _i82;
import '../../image_picking/image_picker_provider/image_picker_provider.dart'
    as _i114;
import '../../image_picking/implementation/image_picking_service_imp.dart'
    as _i83;
import '../../localization/initializer/locale_initializer.dart' as _i115;
import '../../localization/l10n_manager/localization_manager.dart' as _i84;
import '../../localization/use_case/localization_use_case.dart' as _i85;
import '../../modules/authentication/data/api_manager/auth_api_manager.dart'
    as _i3;
import '../../modules/authentication/data/data_sources_contracts/auth_local_datasource.dart'
    as _i57;
import '../../modules/authentication/data/data_sources_contracts/login/login_remote_datasource.dart'
    as _i32;
import '../../modules/authentication/data/data_sources_contracts/sign_up/sign_up_remote_data_source.dart'
    as _i43;
import '../../modules/authentication/data/data_sources_imp/auth_local_datasource_impl.dart'
    as _i58;
import '../../modules/authentication/data/data_sources_imp/login/login_remote_data_source_impl.dart'
    as _i33;
import '../../modules/authentication/data/data_sources_imp/sign_up/sign_up_data_source_imp.dart'
    as _i44;
import '../../modules/authentication/data/datasource_contract/forget_password_remote_datasource.dart'
    as _i13;
import '../../modules/authentication/data/datasource_contract/reset_password_remote_datasource.dart'
    as _i38;
import '../../modules/authentication/data/datasource_contract/verfy_code_remote_datasource.dart'
    as _i51;
import '../../modules/authentication/data/datasource_imp/forget_password_remote_datasource_imp.dart'
    as _i14;
import '../../modules/authentication/data/datasource_imp/reset_password_remote_datasource_imp.dart'
    as _i39;
import '../../modules/authentication/data/datasource_imp/verfy_code_remote_datasource_imp.dart'
    as _i52;
import '../../modules/authentication/data/repo_impl/forget_password_repo_imp.dart'
    as _i16;
import '../../modules/authentication/data/repo_impl/reset_password_repo_imp.dart'
    as _i41;
import '../../modules/authentication/data/repo_impl/verfy_code_repo_imp.dart'
    as _i54;
import '../../modules/authentication/data/repositories_imp/login/login_repo_impl.dart'
    as _i87;
import '../../modules/authentication/data/repositories_imp/sign_up/sign_up_repository_imp.dart'
    as _i46;
import '../../modules/authentication/domain/repo_contract/forget_password_repo.dart'
    as _i15;
import '../../modules/authentication/domain/repo_contract/reset_password_repo.dart'
    as _i40;
import '../../modules/authentication/domain/repo_contract/verfy_code_repo.dart'
    as _i53;
import '../../modules/authentication/domain/repositories_contracts/login/login_repo.dart'
    as _i86;
import '../../modules/authentication/domain/repositories_contracts/sign_up/sign_up_repository.dart'
    as _i45;
import '../../modules/authentication/domain/use_cases/login/login_use_case.dart'
    as _i88;
import '../../modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart'
    as _i47;
import '../../modules/authentication/domain/usecases/forget_password_usecase.dart'
    as _i18;
import '../../modules/authentication/domain/usecases/reset_password_usecase.dart'
    as _i42;
import '../../modules/authentication/domain/usecases/verfy_code_usecase.dart'
    as _i55;
import '../../modules/authentication/ui/forget_password/layouts/forget_password_layout/view_model/forget_password_cubit.dart'
    as _i76;
import '../../modules/authentication/ui/forget_password/layouts/reset_password_layout/view_model/reset_password_cubit.dart'
    as _i96;
import '../../modules/authentication/ui/forget_password/layouts/verify_email_layout/view_model/verify_email_cubit.dart'
    as _i56;
import '../../modules/authentication/ui/forget_password/view_model/forget_password_screen_view_model.dart'
    as _i17;
import '../../modules/authentication/ui/login/view_model/login_view_model.dart'
    as _i89;
import '../../modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart'
    as _i48;
import '../../modules/change_password/data/api/api_client/change_password_api_client.dart'
    as _i59;
import '../../modules/change_password/data/api/api_client_provider/change_password_api_client_provider.dart'
    as _i116;
import '../../modules/change_password/data/data_source_contracts/change_password/change_password_local_data_source.dart'
    as _i60;
import '../../modules/change_password/data/data_source_contracts/change_password/change_password_remote_data_source.dart'
    as _i62;
import '../../modules/change_password/data/data_source_imps/change_password/change_password_local_data_source_imp.dart'
    as _i61;
import '../../modules/change_password/data/data_source_imps/change_password/change_password_remote_data_source_imp.dart'
    as _i63;
import '../../modules/change_password/data/repositories_imp/change_password/change_password_repository_imp.dart'
    as _i65;
import '../../modules/change_password/domain/repositories_contracts/change_password/change_password_repository.dart'
    as _i64;
import '../../modules/change_password/domain/use_cases/change_password/change_password_use_case.dart'
    as _i66;
import '../../modules/change_password/ui/view_model/change_password_screen_view_model.dart'
    as _i98;
import '../../modules/edit_profile/data/api/api_client/edit_profile_api_client.dart'
    as _i5;
import '../../modules/edit_profile/data/api/api_client_provider/edit_profile_api_client_provider.dart'
    as _i111;
import '../../modules/edit_profile/data/data_source_contracts/edit_profile/edit_profile_local_data_source.dart'
    as _i69;
import '../../modules/edit_profile/data/data_source_contracts/edit_profile/edit_profile_remote_data_source.dart'
    as _i6;
import '../../modules/edit_profile/data/data_source_imps/edit_profile/edit_profile_local_data_source_imp.dart'
    as _i70;
import '../../modules/edit_profile/data/data_source_imps/edit_profile/edit_profile_remote_data_source_imp.dart'
    as _i7;
import '../../modules/edit_profile/data/repositories_imp/edit_profile/edit_profile_repository_imp.dart'
    as _i72;
import '../../modules/edit_profile/domain/entities/image_entity/image_entity.dart'
    as _i26;
import '../../modules/edit_profile/domain/repositories_contracts/edit_profile/edit_profile_repository.dart'
    as _i71;
import '../../modules/edit_profile/domain/use_cases/edit_profile/edit_profile_use_case.dart'
    as _i73;
import '../../modules/edit_profile/ui/view_model/edit_profile_screen_view_model.dart'
    as _i103;
import '../../modules/home/UI/layouts/explore_layout/view_model/exam/exam_cubit.dart'
    as _i104;
import '../../modules/home/UI/layouts/explore_layout/view_model/exam_score/exam_score_cubit.dart'
    as _i105;
import '../../modules/home/UI/layouts/explore_layout/view_model/explore/explore_cubit.dart'
    as _i106;
import '../../modules/home/UI/layouts/explore_layout/view_model/questions/questions_cubit.dart'
    as _i108;
import '../../modules/home/UI/layouts/profile_layout/view_model/profile_view_model.dart'
    as _i95;
import '../../modules/home/UI/layouts/settings_layout/view_model/settings_view_model.dart'
    as _i109;
import '../../modules/home/UI/view_model/home_view_model.dart' as _i107;
import '../../modules/home/data/api/api_client/home_api_client.dart' as _i19;
import '../../modules/home/data/api/api_client_provider/home_api_client_provider.dart'
    as _i113;
import '../../modules/home/data/api_manager/explore_api_manager.dart' as _i9;
import '../../modules/home/data/data_source_contracts/delete_account/delete_account_remote_data_source.dart'
    as _i67;
import '../../modules/home/data/data_source_contracts/explore_data_source.dart'
    as _i10;
import '../../modules/home/data/data_source_contracts/get_logged_user_info/logged_user_info_remote_data_source.dart'
    as _i28;
import '../../modules/home/data/data_source_contracts/logout/logout_remote_data_source.dart'
    as _i34;
import '../../modules/home/data/data_source_contracts/logout_delete_account_local_data_source.dart'
    as _i90;
import '../../modules/home/data/data_source_contracts/questions_offline_data_source.dart'
    as _i36;
import '../../modules/home/data/data_source_imp/delete_account/delete_account_remote_data_source_imp.dart'
    as _i68;
import '../../modules/home/data/data_source_imp/explore_data_source_imp.dart'
    as _i11;
import '../../modules/home/data/data_source_imp/get_logged_user_info/logged_user_info_remote_data_source_imp.dart'
    as _i29;
import '../../modules/home/data/data_source_imp/logout/logout_remote_data_source_imp.dart'
    as _i35;
import '../../modules/home/data/data_source_imp/logout_delete_account_local_data_source_imp.dart'
    as _i91;
import '../../modules/home/data/data_source_imp/questions_offline_data_source_impl.dart'
    as _i37;
import '../../modules/home/data/repository_imp/delete_account/delete_account_repository_imp.dart'
    as _i101;
import '../../modules/home/data/repository_imp/explore_repository_imp.dart'
    as _i75;
import '../../modules/home/data/repository_imp/get_logged_user_info/logged_user_info_repository_imp.dart'
    as _i31;
import '../../modules/home/data/repository_imp/logout/logout_repository_imp.dart'
    as _i93;
import '../../modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart'
    as _i23;
import '../../modules/home/domain/repositories_contracts/delete_account/delete_account_repository.dart'
    as _i100;
import '../../modules/home/domain/repositories_contracts/explore_repository.dart'
    as _i74;
import '../../modules/home/domain/repositories_contracts/get_logged_user_info/logged_user_info_repository.dart'
    as _i30;
import '../../modules/home/domain/repositories_contracts/logout/logout_repository.dart'
    as _i92;
import '../../modules/home/domain/use_cases/check_questions.dart' as _i99;
import '../../modules/home/domain/use_cases/delete_account/delete_account_use_case.dart'
    as _i102;
import '../../modules/home/domain/use_cases/get_all_exams_on_subject.dart'
    as _i77;
import '../../modules/home/domain/use_cases/get_all_questions.dart' as _i78;
import '../../modules/home/domain/use_cases/get_all_subjects_use_case.dart'
    as _i79;
import '../../modules/home/domain/use_cases/get_cashed_question.dart' as _i80;
import '../../modules/home/domain/use_cases/get_logged_user_info/get_logged_user_info_use_case.dart'
    as _i81;
import '../../modules/home/domain/use_cases/logout/logout_use_case.dart'
    as _i94;
import '../../modules/home/domain/use_cases/save_questions.dart' as _i97;
import '../../storage/contracts/isar_storage_service_cashed_question_entity_contract.dart'
    as _i22;
import '../../storage/contracts/isar_storage_service_image_entity_contract.dart'
    as _i25;
import '../../storage/contracts/storage_service_contract.dart' as _i49;
import '../../storage/implementation/isar_storage_service_cashed_question_entity_impl.dart'
    as _i24;
import '../../storage/implementation/isar_storage_service_image_entity_imp.dart'
    as _i27;
import '../../storage/implementation/storage_service_imp.dart' as _i50;
import '../../storage/initializer/storage_initializer.dart' as _i112;
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
    gh.singleton<_i9.ExploreApiManager>(() => _i9.ExploreApiManager());
    gh.factory<_i10.ExploreDataSource>(
        () => _i11.HomeDataSourceImpl(apiManager: gh<_i9.ExploreApiManager>()));
    await gh.factoryAsync<_i12.FlutterSecureStorage>(
      () => storageInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    gh.factory<_i13.ForgetPasswordRemoteDatasource>(() =>
        _i14.ForgetPasswordRemoteDatasourceImp(
            apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i15.ForgetPasswordRepo>(() => _i16.ForgetPasswordRepoImp(
        forgetPasswordRemoteDatasource:
            gh<_i13.ForgetPasswordRemoteDatasource>()));
    gh.factory<_i17.ForgetPasswordScreenViewModel>(
        () => _i17.ForgetPasswordScreenViewModel());
    gh.factory<_i18.ForgetPasswordUseCase>(() => _i18.ForgetPasswordUseCase(
        forgetPasswordRepo: gh<_i15.ForgetPasswordRepo>()));
    gh.singleton<_i19.HomeApiClient>(
        () => homeApiClientProvider.provideApiClient(gh<_i4.Dio>()));
    gh.lazySingleton<_i20.ImagePicker>(
        () => imagePickerProvider.providerInstance());
    await gh.factoryAsync<_i21.Isar>(
      () => storageInitializer.initIsarInstance(),
      preResolve: true,
    );
    gh.factory<
            _i22.IsarStorageServiceCachedQuestionEntity<_i23.CashedQuestions>>(
        () => _i24.IsarStorageServiceCashedQuestionEntityImpl(
            isar: gh<_i21.Isar>()));
    gh.factory<_i25.IsarStorageServiceImageEntity<_i26.ImageEntity>>(
        () => _i27.IsarStorageServiceImageEntityImp(gh<_i21.Isar>()));
    gh.factory<_i28.LoggedUserInfoRemoteDataSource>(
        () => _i29.LoggedUserInfoRemoteDataSourceImp(gh<_i19.HomeApiClient>()));
    gh.factory<_i30.LoggedUserInfoRepository>(() =>
        _i31.LoggedUserInfoRepositoryImp(
            gh<_i28.LoggedUserInfoRemoteDataSource>()));
    gh.factory<_i32.LoginRemoteDataSource>(() =>
        _i33.LoginRemoteDataSourceImpl(apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i34.LogoutRemoteDataSource>(
        () => _i35.LogoutRemoteDataSourceImp(gh<_i19.HomeApiClient>()));
    gh.factory<_i36.QuestionsOfflineDataSource>(() =>
        _i37.QuestionsOfflineDataSourceImpl(
            database: gh<
                _i22.IsarStorageServiceCachedQuestionEntity<
                    _i23.CashedQuestions>>()));
    gh.factory<_i38.ResetPasswordRemoteDataSource>(() =>
        _i39.ResetPasswordRemoteDatasourceImp(
            apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i40.ResetPasswordRepo>(() => _i41.ResetPasswordRepoImp(
        resetPasswordRemoteDataSource:
            gh<_i38.ResetPasswordRemoteDataSource>()));
    gh.factory<_i42.ResetPasswordUseCase>(() => _i42.ResetPasswordUseCase(
        resetPasswordRepo: gh<_i40.ResetPasswordRepo>()));
    gh.factory<_i43.SignUpRemoteDataSource>(() =>
        _i44.SignUpRemoteDataSourceImp(apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i45.SignUpRepository>(() => _i46.SignUpRepositoryImp(
        signUpRemoteDataSource: gh<_i43.SignUpRemoteDataSource>()));
    gh.factory<_i47.SignUpUseCase>(() =>
        _i47.SignUpUseCase(signUpRepository: gh<_i45.SignUpRepository>()));
    gh.factory<_i48.SignUpViewModel>(
        () => _i48.SignUpViewModel(gh<_i47.SignUpUseCase>()));
    gh.singleton<_i49.StorageService<_i12.FlutterSecureStorage>>(
        () => _i50.StorageServiceImp(
              gh<_i8.ErrorNotifier>(),
              gh<_i12.FlutterSecureStorage>(),
            ));
    await gh.factoryAsync<String>(
      () => localeInitializer.initCurrentLocal(
          gh<_i49.StorageService<_i12.FlutterSecureStorage>>()),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    await gh.factoryAsync<String>(
      () => dioService
          .getToken(gh<_i49.StorageService<_i12.FlutterSecureStorage>>()),
      preResolve: true,
    );
    gh.factory<_i51.VerifyCodeRemoteDatasource>(() =>
        _i52.VerifyCodeRemoteDatasourceImp(
            apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i53.VerifyCodeRepo>(() => _i54.VerifyCodeRepoImp(
        verifyCodeRemoteDatasource: gh<_i51.VerifyCodeRemoteDatasource>()));
    gh.factory<_i55.VerifyCodeUseSase>(() =>
        _i55.VerifyCodeUseSase(verifyCodeRepo: gh<_i53.VerifyCodeRepo>()));
    gh.factory<_i56.VerifyEmailCubit>(() => _i56.VerifyEmailCubit(
          verifyCodeUseCase: gh<_i55.VerifyCodeUseSase>(),
          forgetPasswordUseCase: gh<_i18.ForgetPasswordUseCase>(),
        ));
    gh.factory<_i57.AuthLocalDataSource>(() => _i58.AuthLocalDataSourceImpl(
        storageService: gh<_i49.StorageService<_i12.FlutterSecureStorage>>()));
    gh.factory<_i59.ChangePasswordApiClient>(
        () => changePasswordApiClientProvider.provideClient(gh<_i4.Dio>()));
    gh.factory<_i60.ChangePasswordLocalDataSource>(() =>
        _i61.ChangePasswordLocalDataSourceImp(
            gh<_i49.StorageService<_i12.FlutterSecureStorage>>()));
    gh.factory<_i62.ChangePasswordRemoteDataSource>(() =>
        _i63.ChangePasswordRemoteDataSourceImp(
            gh<_i59.ChangePasswordApiClient>()));
    gh.factory<_i64.ChangePasswordRepository>(
        () => _i65.ChangePasswordRepositoryImp(
              gh<_i62.ChangePasswordRemoteDataSource>(),
              gh<_i60.ChangePasswordLocalDataSource>(),
            ));
    gh.factory<_i66.ChangePasswordUseCase>(
        () => _i66.ChangePasswordUseCase(gh<_i64.ChangePasswordRepository>()));
    gh.factory<_i67.DeleteAccountRemoteDataSource>(
        () => _i68.DeleteAccountRemoteDataSourceImp(gh<_i19.HomeApiClient>()));
    gh.factory<_i69.EditProfileLocalDataSource>(() =>
        _i70.EditProfileLocalDataSourceImp(
            gh<_i49.StorageService<_i12.FlutterSecureStorage>>()));
    gh.factory<_i71.EditProfileRepository>(() => _i72.EditProfileRepositoryImp(
          gh<_i6.EditProfileRemoteDataSource>(),
          gh<_i69.EditProfileLocalDataSource>(),
        ));
    gh.factory<_i73.EditProfileUseCase>(
        () => _i73.EditProfileUseCase(gh<_i71.EditProfileRepository>()));
    gh.factory<_i74.ExploreRepository>(() => _i75.HomeRepositoryImp(
          homeDataSource: gh<_i10.ExploreDataSource>(),
          questionsOfflineDataSource: gh<_i36.QuestionsOfflineDataSource>(),
        ));
    gh.factory<_i76.ForgetPasswordCubit>(() => _i76.ForgetPasswordCubit(
        forgetPasswordUseCase: gh<_i18.ForgetPasswordUseCase>()));
    gh.factory<_i77.GetAllExamsOnSubjectUseCase>(() =>
        _i77.GetAllExamsOnSubjectUseCase(
            homeRepo: gh<_i74.ExploreRepository>()));
    gh.factory<_i78.GetAllQuestionsUseCase>(() =>
        _i78.GetAllQuestionsUseCase(homeRepo: gh<_i74.ExploreRepository>()));
    gh.factory<_i79.GetAllSubjectsUseCase>(
        () => _i79.GetAllSubjectsUseCase(repo: gh<_i74.ExploreRepository>()));
    gh.factory<_i80.GetCashedQuestionUseCase>(() =>
        _i80.GetCashedQuestionUseCase(
            exploreRepository: gh<_i74.ExploreRepository>()));
    gh.factory<_i81.GetLoggedUserInfoUseCase>(() =>
        _i81.GetLoggedUserInfoUseCase(gh<_i30.LoggedUserInfoRepository>()));
    gh.factory<_i82.ImagePickingService>(() => _i83.ImagePickingServiceImp(
          gh<_i20.ImagePicker>(),
          gh<_i8.ErrorNotifier>(),
          gh<_i25.IsarStorageServiceImageEntity<_i26.ImageEntity>>(),
        ));
    gh.singleton<_i84.LocalizationManager>(() => _i84.LocalizationManager(
          gh<_i49.StorageService<_i12.FlutterSecureStorage>>(),
          gh<String>(instanceName: 'initCurrentLocal'),
        ));
    gh.factory<_i85.LocalizationUseCase>(
        () => _i85.LocalizationUseCase(gh<_i84.LocalizationManager>()));
    gh.factory<_i86.LoginRepo>(() => _i87.LoginRepoImpl(
          authRemoteDataSource: gh<_i32.LoginRemoteDataSource>(),
          authLocalDataSource: gh<_i57.AuthLocalDataSource>(),
        ));
    gh.factory<_i88.LoginUseCase>(
        () => _i88.LoginUseCase(authRepo: gh<_i86.LoginRepo>()));
    gh.factory<_i89.LoginViewModel>(
        () => _i89.LoginViewModel(loginUseCase: gh<_i88.LoginUseCase>()));
    gh.factory<_i90.LogoutDeleteAccountLocalDataSource>(() =>
        _i91.LogoutDeleteAccountLocalDataSourceImp(
            gh<_i49.StorageService<_i12.FlutterSecureStorage>>()));
    gh.factory<_i92.LogoutRepository>(() => _i93.LogoutRepositoryImp(
          gh<_i34.LogoutRemoteDataSource>(),
          gh<_i90.LogoutDeleteAccountLocalDataSource>(),
        ));
    gh.factory<_i94.LogoutUseCase>(
        () => _i94.LogoutUseCase(gh<_i92.LogoutRepository>()));
    gh.factory<_i95.ProfileViewModel>(() => _i95.ProfileViewModel(
          gh<_i81.GetLoggedUserInfoUseCase>(),
          gh<_i82.ImagePickingService>(),
        ));
    gh.factory<_i96.ResetPasswordCubit>(() => _i96.ResetPasswordCubit(
        resetPasswordUseCase: gh<_i42.ResetPasswordUseCase>()));
    gh.factory<_i97.SaveQuestionsUseCase>(() => _i97.SaveQuestionsUseCase(
        exploreRepository: gh<_i74.ExploreRepository>()));
    gh.factory<_i98.ChangePasswordScreenViewModel>(() =>
        _i98.ChangePasswordScreenViewModel(gh<_i66.ChangePasswordUseCase>()));
    gh.factory<_i99.CheckQuestionsUseCase>(() => _i99.CheckQuestionsUseCase(
        homeRepository: gh<_i74.ExploreRepository>()));
    gh.factory<_i100.DeleteAccountRepository>(
        () => _i101.DeleteAccountRepositoryImp(
              gh<_i67.DeleteAccountRemoteDataSource>(),
              gh<_i90.LogoutDeleteAccountLocalDataSource>(),
            ));
    gh.factory<_i102.DeleteAccountUseCase>(
        () => _i102.DeleteAccountUseCase(gh<_i100.DeleteAccountRepository>()));
    gh.factory<_i103.EditProfileScreenViewModel>(
        () => _i103.EditProfileScreenViewModel(
              gh<_i73.EditProfileUseCase>(),
              gh<_i82.ImagePickingService>(),
            ));
    gh.factory<_i104.ExamCubit>(() => _i104.ExamCubit(
        getAllExamsOnSubjectUseCase: gh<_i77.GetAllExamsOnSubjectUseCase>()));
    gh.factory<_i105.ExamScoreCubit>(() => _i105.ExamScoreCubit(
        checkQuestionsUseCase: gh<_i99.CheckQuestionsUseCase>()));
    gh.factory<_i106.ExploreCubit>(() => _i106.ExploreCubit(
        getAllSubjectsUseCase: gh<_i79.GetAllSubjectsUseCase>()));
    gh.factory<_i107.HomeViewModel>(
        () => _i107.HomeViewModel(gh<_i82.ImagePickingService>()));
    gh.factory<_i108.QuestionsCubit>(() => _i108.QuestionsCubit(
          getAllQuestionsUseCase: gh<_i78.GetAllQuestionsUseCase>(),
          checkQuestionsUseCase: gh<_i99.CheckQuestionsUseCase>(),
          saveQuestionsUseCase: gh<_i97.SaveQuestionsUseCase>(),
          getCashedQuestionUseCase: gh<_i80.GetCashedQuestionUseCase>(),
        ));
    gh.factory<_i109.SettingsViewModel>(() => _i109.SettingsViewModel(
          gh<_i94.LogoutUseCase>(),
          gh<_i102.DeleteAccountUseCase>(),
        ));
    return this;
  }
}

class _$DioService extends _i110.DioService {}

class _$EditProfileApiClientProvider
    extends _i111.EditProfileApiClientProvider {}

class _$StorageInitializer extends _i112.StorageInitializer {}

class _$HomeApiClientProvider extends _i113.HomeApiClientProvider {}

class _$ImagePickerProvider extends _i114.ImagePickerProvider {}

class _$LocaleInitializer extends _i115.LocaleInitializer {}

class _$ChangePasswordApiClientProvider
    extends _i116.ChangePasswordApiClientProvider {}
