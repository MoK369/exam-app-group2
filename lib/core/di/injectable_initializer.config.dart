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
import 'package:image_picker/image_picker.dart' as _i14;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i15;

import '../../dio_service/dio_service.dart' as _i91;
import '../../image_picking/contracts/image_picking_service_contract.dart'
    as _i64;
import '../../image_picking/image_picker_provider/image_picker_provider.dart'
    as _i95;
import '../../image_picking/implementation/image_picking_service_imp.dart'
    as _i65;
import '../../localization/initializer/locale_initializer.dart' as _i96;
import '../../localization/l10n_manager/localization_manager.dart' as _i66;
import '../../localization/use_case/localization_use_case.dart' as _i67;
import '../../modules/authentication/data/api_manager/auth_api_manager.dart'
    as _i3;
import '../../modules/authentication/data/data_sources_contracts/auth_local_datasource.dart'
    as _i40;
import '../../modules/authentication/data/data_sources_contracts/login/login_remote_datasource.dart'
    as _i26;
import '../../modules/authentication/data/data_sources_contracts/sign_up/sign_up_remote_data_source.dart'
    as _i32;
import '../../modules/authentication/data/data_sources_imp/auth_local_datasource_impl.dart'
    as _i41;
import '../../modules/authentication/data/data_sources_imp/login/login_remote_data_source_impl.dart'
    as _i27;
import '../../modules/authentication/data/data_sources_imp/sign_up/sign_up_data_source_imp.dart'
    as _i33;
import '../../modules/authentication/data/repositories_imp/login/login_repo_impl.dart'
    as _i69;
import '../../modules/authentication/data/repositories_imp/sign_up/sign_up_repository_imp.dart'
    as _i35;
import '../../modules/authentication/domain/repositories_contracts/login/login_repo.dart'
    as _i68;
import '../../modules/authentication/domain/repositories_contracts/sign_up/sign_up_repository.dart'
    as _i34;
import '../../modules/authentication/domain/use_cases/login/login_use_case.dart'
    as _i70;
import '../../modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart'
    as _i36;
import '../../modules/authentication/ui/login/view_model/login_view_model.dart'
    as _i71;
import '../../modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart'
    as _i37;
import '../../modules/change_password/data/api/api_client/change_password_api_client.dart'
    as _i42;
import '../../modules/change_password/data/api/api_client_provider/change_password_api_client_provider.dart'
    as _i97;
import '../../modules/change_password/data/data_source_contracts/change_password/change_password_local_data_source.dart'
    as _i43;
import '../../modules/change_password/data/data_source_contracts/change_password/change_password_remote_data_source.dart'
    as _i45;
import '../../modules/change_password/data/data_source_imps/change_password/change_password_local_data_source_imp.dart'
    as _i44;
import '../../modules/change_password/data/data_source_imps/change_password/change_password_remote_data_source_imp.dart'
    as _i46;
import '../../modules/change_password/data/repositories_imp/change_password/change_password_repository_imp.dart'
    as _i48;
import '../../modules/change_password/domain/repositories_contracts/change_password/change_password_repository.dart'
    as _i47;
import '../../modules/change_password/domain/use_cases/change_password/change_password_use_case.dart'
    as _i49;
import '../../modules/change_password/ui/view_model/change_password_screen_view_model.dart'
    as _i79;
import '../../modules/edit_profile/data/api/api_client/edit_profile_api_client.dart'
    as _i5;
import '../../modules/edit_profile/data/api/api_client_provider/edit_profile_api_client_provider.dart'
    as _i92;
import '../../modules/edit_profile/data/data_source_contracts/edit_profile/edit_profile_local_data_source.dart'
    as _i52;
import '../../modules/edit_profile/data/data_source_contracts/edit_profile/edit_profile_remote_data_source.dart'
    as _i6;
import '../../modules/edit_profile/data/data_source_imps/edit_profile/edit_profile_local_data_source_imp.dart'
    as _i53;
import '../../modules/edit_profile/data/data_source_imps/edit_profile/edit_profile_remote_data_source_imp.dart'
    as _i7;
import '../../modules/edit_profile/data/repositories_imp/edit_profile/edit_profile_repository_imp.dart'
    as _i55;
import '../../modules/edit_profile/domain/entities/image_entity/image_entity.dart'
    as _i20;
import '../../modules/edit_profile/domain/repositories_contracts/edit_profile/edit_profile_repository.dart'
    as _i54;
import '../../modules/edit_profile/domain/use_cases/edit_profile/edit_profile_use_case.dart'
    as _i56;
import '../../modules/edit_profile/ui/view_model/edit_profile_screen_view_model.dart'
    as _i84;
import '../../modules/home/UI/layouts/explore_layout/view_model/exam/exam_cubit.dart'
    as _i85;
import '../../modules/home/UI/layouts/explore_layout/view_model/exam_score/exam_score_cubit.dart'
    as _i86;
import '../../modules/home/UI/layouts/explore_layout/view_model/explore/explore_cubit.dart'
    as _i87;
import '../../modules/home/UI/layouts/explore_layout/view_model/questions/questions_cubit.dart'
    as _i89;
import '../../modules/home/UI/layouts/profile_layout/view_model/profile_view_model.dart'
    as _i77;
import '../../modules/home/UI/layouts/settings_layout/view_model/settings_view_model.dart'
    as _i90;
import '../../modules/home/UI/view_model/home_view_model.dart' as _i88;
import '../../modules/home/data/api/api_client/home_api_client.dart' as _i13;
import '../../modules/home/data/api/api_client_provider/home_api_client_provider.dart'
    as _i94;
import '../../modules/home/data/api_manager/explore_api_manager.dart' as _i9;
import '../../modules/home/data/data_source_contracts/delete_account/delete_account_remote_data_source.dart'
    as _i50;
import '../../modules/home/data/data_source_contracts/explore_data_source.dart'
    as _i10;
import '../../modules/home/data/data_source_contracts/get_logged_user_info/logged_user_info_remote_data_source.dart'
    as _i22;
import '../../modules/home/data/data_source_contracts/logout/logout_remote_data_source.dart'
    as _i28;
import '../../modules/home/data/data_source_contracts/logout_delete_account_local_data_source.dart'
    as _i72;
import '../../modules/home/data/data_source_contracts/questions_offline_data_source.dart'
    as _i30;
import '../../modules/home/data/data_source_imp/delete_account/delete_account_remote_data_source_imp.dart'
    as _i51;
import '../../modules/home/data/data_source_imp/explore_data_source_imp.dart'
    as _i11;
import '../../modules/home/data/data_source_imp/get_logged_user_info/logged_user_info_remote_data_source_imp.dart'
    as _i23;
import '../../modules/home/data/data_source_imp/logout/logout_remote_data_source_imp.dart'
    as _i29;
import '../../modules/home/data/data_source_imp/logout_delete_account_local_data_source_imp.dart'
    as _i73;
import '../../modules/home/data/data_source_imp/questions_offline_data_source_impl.dart'
    as _i31;
import '../../modules/home/data/repository_imp/delete_account/delete_account_repository_imp.dart'
    as _i82;
import '../../modules/home/data/repository_imp/explore_repository_imp.dart'
    as _i58;
import '../../modules/home/data/repository_imp/get_logged_user_info/logged_user_info_repository_imp.dart'
    as _i25;
import '../../modules/home/data/repository_imp/logout/logout_repository_imp.dart'
    as _i75;
import '../../modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart'
    as _i17;
import '../../modules/home/domain/repositories_contracts/delete_account/delete_account_repository.dart'
    as _i81;
import '../../modules/home/domain/repositories_contracts/explore_repository.dart'
    as _i57;
import '../../modules/home/domain/repositories_contracts/get_logged_user_info/logged_user_info_repository.dart'
    as _i24;
import '../../modules/home/domain/repositories_contracts/logout/logout_repository.dart'
    as _i74;
import '../../modules/home/domain/use_cases/check_questions.dart' as _i80;
import '../../modules/home/domain/use_cases/delete_account/delete_account_use_case.dart'
    as _i83;
import '../../modules/home/domain/use_cases/get_all_exams_on_subject.dart'
    as _i59;
import '../../modules/home/domain/use_cases/get_all_questions.dart' as _i60;
import '../../modules/home/domain/use_cases/get_all_subjects_use_case.dart'
    as _i61;
import '../../modules/home/domain/use_cases/get_cashed_question.dart' as _i62;
import '../../modules/home/domain/use_cases/get_logged_user_info/get_logged_user_info_use_case.dart'
    as _i63;
import '../../modules/home/domain/use_cases/logout/logout_use_case.dart'
    as _i76;
import '../../modules/home/domain/use_cases/save_questions.dart' as _i78;
import '../../storage/contracts/isar_storage_service_cashed_question_entity_contract.dart'
    as _i16;
import '../../storage/contracts/isar_storage_service_image_entity_contract.dart'
    as _i19;
import '../../storage/contracts/storage_service_contract.dart' as _i38;
import '../../storage/implementation/isar_storage_service_cashed_question_entity_impl.dart'
    as _i18;
import '../../storage/implementation/isar_storage_service_image_entity_imp.dart'
    as _i21;
import '../../storage/implementation/storage_service_imp.dart' as _i39;
import '../../storage/initializer/storage_initializer.dart' as _i93;
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
    gh.singleton<_i13.HomeApiClient>(
        () => homeApiClientProvider.provideApiClient(gh<_i4.Dio>()));
    gh.lazySingleton<_i14.ImagePicker>(
        () => imagePickerProvider.providerInstance());
    await gh.factoryAsync<_i15.Isar>(
      () => storageInitializer.initIsarInstance(),
      preResolve: true,
    );
    gh.factory<
            _i16.IsarStorageServiceCachedQuestionEntity<_i17.CashedQuestions>>(
        () => _i18.IsarStorageServiceCashedQuestionEntityImpl(
            isar: gh<_i15.Isar>()));
    gh.factory<_i19.IsarStorageServiceImageEntity<_i20.ImageEntity>>(
        () => _i21.IsarStorageServiceImageEntityImp(gh<_i15.Isar>()));
    gh.factory<_i22.LoggedUserInfoRemoteDataSource>(
        () => _i23.LoggedUserInfoRemoteDataSourceImp(gh<_i13.HomeApiClient>()));
    gh.factory<_i24.LoggedUserInfoRepository>(() =>
        _i25.LoggedUserInfoRepositoryImp(
            gh<_i22.LoggedUserInfoRemoteDataSource>()));
    gh.factory<_i26.LoginRemoteDataSource>(() =>
        _i27.LoginRemoteDataSourceImpl(apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i28.LogoutRemoteDataSource>(
        () => _i29.LogoutRemoteDataSourceImp(gh<_i13.HomeApiClient>()));
    gh.factory<_i30.QuestionsOfflineDataSource>(() =>
        _i31.QuestionsOfflineDataSourceImpl(
            database: gh<
                _i16.IsarStorageServiceCachedQuestionEntity<
                    _i17.CashedQuestions>>()));
    gh.factory<_i32.SignUpRemoteDataSource>(() =>
        _i33.SignUpRemoteDataSourceImp(apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i34.SignUpRepository>(() => _i35.SignUpRepositoryImp(
        signUpRemoteDataSource: gh<_i32.SignUpRemoteDataSource>()));
    gh.factory<_i36.SignUpUseCase>(() =>
        _i36.SignUpUseCase(signUpRepository: gh<_i34.SignUpRepository>()));
    gh.factory<_i37.SignUpViewModel>(
        () => _i37.SignUpViewModel(gh<_i36.SignUpUseCase>()));
    gh.singleton<_i38.StorageService<_i12.FlutterSecureStorage>>(
        () => _i39.StorageServiceImp(
              gh<_i8.ErrorNotifier>(),
              gh<_i12.FlutterSecureStorage>(),
            ));
    await gh.factoryAsync<String>(
      () => dioService
          .getToken(gh<_i38.StorageService<_i12.FlutterSecureStorage>>()),
      preResolve: true,
    );
    await gh.factoryAsync<String>(
      () => localeInitializer.initCurrentLocal(
          gh<_i38.StorageService<_i12.FlutterSecureStorage>>()),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    gh.factory<_i40.AuthLocalDataSource>(() => _i41.AuthLocalDataSourceImpl(
        storageService: gh<_i38.StorageService<_i12.FlutterSecureStorage>>()));
    gh.factory<_i42.ChangePasswordApiClient>(
        () => changePasswordApiClientProvider.provideClient(gh<_i4.Dio>()));
    gh.factory<_i43.ChangePasswordLocalDataSource>(() =>
        _i44.ChangePasswordLocalDataSourceImp(
            gh<_i38.StorageService<_i12.FlutterSecureStorage>>()));
    gh.factory<_i45.ChangePasswordRemoteDataSource>(() =>
        _i46.ChangePasswordRemoteDataSourceImp(
            gh<_i42.ChangePasswordApiClient>()));
    gh.factory<_i47.ChangePasswordRepository>(
        () => _i48.ChangePasswordRepositoryImp(
              gh<_i45.ChangePasswordRemoteDataSource>(),
              gh<_i43.ChangePasswordLocalDataSource>(),
            ));
    gh.factory<_i49.ChangePasswordUseCase>(
        () => _i49.ChangePasswordUseCase(gh<_i47.ChangePasswordRepository>()));
    gh.factory<_i50.DeleteAccountRemoteDataSource>(
        () => _i51.DeleteAccountRemoteDataSourceImp(gh<_i13.HomeApiClient>()));
    gh.factory<_i52.EditProfileLocalDataSource>(() =>
        _i53.EditProfileLocalDataSourceImp(
            gh<_i38.StorageService<_i12.FlutterSecureStorage>>()));
    gh.factory<_i54.EditProfileRepository>(() => _i55.EditProfileRepositoryImp(
          gh<_i6.EditProfileRemoteDataSource>(),
          gh<_i52.EditProfileLocalDataSource>(),
        ));
    gh.factory<_i56.EditProfileUseCase>(
        () => _i56.EditProfileUseCase(gh<_i54.EditProfileRepository>()));
    gh.factory<_i57.ExploreRepository>(() => _i58.HomeRepositoryImp(
          homeDataSource: gh<_i10.ExploreDataSource>(),
          questionsOfflineDataSource: gh<_i30.QuestionsOfflineDataSource>(),
        ));
    gh.factory<_i59.GetAllExamsOnSubjectUseCase>(() =>
        _i59.GetAllExamsOnSubjectUseCase(
            homeRepo: gh<_i57.ExploreRepository>()));
    gh.factory<_i60.GetAllQuestionsUseCase>(() =>
        _i60.GetAllQuestionsUseCase(homeRepo: gh<_i57.ExploreRepository>()));
    gh.factory<_i61.GetAllSubjectsUseCase>(
        () => _i61.GetAllSubjectsUseCase(repo: gh<_i57.ExploreRepository>()));
    gh.factory<_i62.GetCashedQuestionUseCase>(() =>
        _i62.GetCashedQuestionUseCase(
            exploreRepository: gh<_i57.ExploreRepository>()));
    gh.factory<_i63.GetLoggedUserInfoUseCase>(() =>
        _i63.GetLoggedUserInfoUseCase(gh<_i24.LoggedUserInfoRepository>()));
    gh.factory<_i64.ImagePickingService>(() => _i65.ImagePickingServiceImp(
          gh<_i14.ImagePicker>(),
          gh<_i8.ErrorNotifier>(),
          gh<_i19.IsarStorageServiceImageEntity<_i20.ImageEntity>>(),
        ));
    gh.singleton<_i66.LocalizationManager>(() => _i66.LocalizationManager(
          gh<_i38.StorageService<_i12.FlutterSecureStorage>>(),
          gh<String>(instanceName: 'initCurrentLocal'),
        ));
    gh.factory<_i67.LocalizationUseCase>(
        () => _i67.LocalizationUseCase(gh<_i66.LocalizationManager>()));
    gh.factory<_i68.LoginRepo>(() => _i69.LoginRepoImpl(
          authRemoteDataSource: gh<_i26.LoginRemoteDataSource>(),
          authLocalDataSource: gh<_i40.AuthLocalDataSource>(),
        ));
    gh.factory<_i70.LoginUseCase>(
        () => _i70.LoginUseCase(authRepo: gh<_i68.LoginRepo>()));
    gh.factory<_i71.LoginViewModel>(
        () => _i71.LoginViewModel(loginUseCase: gh<_i70.LoginUseCase>()));
    gh.factory<_i72.LogoutDeleteAccountLocalDataSource>(() =>
        _i73.LogoutDeleteAccountLocalDataSourceImp(
            gh<_i38.StorageService<_i12.FlutterSecureStorage>>()));
    gh.factory<_i74.LogoutRepository>(() => _i75.LogoutRepositoryImp(
          gh<_i28.LogoutRemoteDataSource>(),
          gh<_i72.LogoutDeleteAccountLocalDataSource>(),
        ));
    gh.factory<_i76.LogoutUseCase>(
        () => _i76.LogoutUseCase(gh<_i74.LogoutRepository>()));
    gh.factory<_i77.ProfileViewModel>(() => _i77.ProfileViewModel(
          gh<_i63.GetLoggedUserInfoUseCase>(),
          gh<_i64.ImagePickingService>(),
        ));
    gh.factory<_i78.SaveQuestionsUseCase>(() => _i78.SaveQuestionsUseCase(
        exploreRepository: gh<_i57.ExploreRepository>()));
    gh.factory<_i79.ChangePasswordScreenViewModel>(() =>
        _i79.ChangePasswordScreenViewModel(gh<_i49.ChangePasswordUseCase>()));
    gh.factory<_i80.CheckQuestionsUseCase>(() => _i80.CheckQuestionsUseCase(
        homeRepository: gh<_i57.ExploreRepository>()));
    gh.factory<_i81.DeleteAccountRepository>(
        () => _i82.DeleteAccountRepositoryImp(
              gh<_i50.DeleteAccountRemoteDataSource>(),
              gh<_i72.LogoutDeleteAccountLocalDataSource>(),
            ));
    gh.factory<_i83.DeleteAccountUseCase>(
        () => _i83.DeleteAccountUseCase(gh<_i81.DeleteAccountRepository>()));
    gh.factory<_i84.EditProfileScreenViewModel>(
        () => _i84.EditProfileScreenViewModel(
              gh<_i56.EditProfileUseCase>(),
              gh<_i64.ImagePickingService>(),
            ));
    gh.factory<_i85.ExamCubit>(() => _i85.ExamCubit(
        getAllExamsOnSubjectUseCase: gh<_i59.GetAllExamsOnSubjectUseCase>()));
    gh.factory<_i86.ExamScoreCubit>(() => _i86.ExamScoreCubit(
        checkQuestionsUseCase: gh<_i80.CheckQuestionsUseCase>()));
    gh.factory<_i87.ExploreCubit>(() => _i87.ExploreCubit(
        getAllSubjectsUseCase: gh<_i61.GetAllSubjectsUseCase>()));
    gh.factory<_i88.HomeViewModel>(
        () => _i88.HomeViewModel(gh<_i64.ImagePickingService>()));
    gh.factory<_i89.QuestionsCubit>(() => _i89.QuestionsCubit(
          getAllQuestionsUseCase: gh<_i60.GetAllQuestionsUseCase>(),
          checkQuestionsUseCase: gh<_i80.CheckQuestionsUseCase>(),
          saveQuestionsUseCase: gh<_i78.SaveQuestionsUseCase>(),
          getCashedQuestionUseCase: gh<_i62.GetCashedQuestionUseCase>(),
        ));
    gh.factory<_i90.SettingsViewModel>(() => _i90.SettingsViewModel(
          gh<_i76.LogoutUseCase>(),
          gh<_i83.DeleteAccountUseCase>(),
        ));
    return this;
  }
}

class _$DioService extends _i91.DioService {}

class _$EditProfileApiClientProvider
    extends _i92.EditProfileApiClientProvider {}

class _$StorageInitializer extends _i93.StorageInitializer {}

class _$HomeApiClientProvider extends _i94.HomeApiClientProvider {}

class _$ImagePickerProvider extends _i95.ImagePickerProvider {}

class _$LocaleInitializer extends _i96.LocaleInitializer {}

class _$ChangePasswordApiClientProvider
    extends _i97.ChangePasswordApiClientProvider {}
