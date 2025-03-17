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
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i10;

import '../../dio_service/dio_service.dart' as _i47;
import '../../localization/initializer/locale_initializer.dart' as _i49;
import '../../localization/l10n_manager/localization_manager.dart' as _i34;
import '../../localization/use_case/localization_use_case.dart' as _i35;
import '../../modules/authentication/data/api_manager/auth_api_manager.dart'
    as _i3;
import '../../modules/authentication/data/data_sources_contracts/auth_local_datasource.dart'
    as _i26;
import '../../modules/authentication/data/data_sources_contracts/login/login_remote_datasource.dart'
    as _i14;
import '../../modules/authentication/data/data_sources_contracts/sign_up/sign_up_remote_data_source.dart'
    as _i18;
import '../../modules/authentication/data/data_sources_imp/auth_local_datasource_impl.dart'
    as _i27;
import '../../modules/authentication/data/data_sources_imp/login/login_remote_data_source_impl.dart'
    as _i15;
import '../../modules/authentication/data/data_sources_imp/sign_up/sign_up_data_source_imp.dart'
    as _i19;
import '../../modules/authentication/data/repositories_imp/login/login_repo_impl.dart'
    as _i37;
import '../../modules/authentication/data/repositories_imp/sign_up/sign_up_repository_imp.dart'
    as _i21;
import '../../modules/authentication/domain/repositories_contracts/login/login_repo.dart'
    as _i36;
import '../../modules/authentication/domain/repositories_contracts/sign_up/sign_up_repository.dart'
    as _i20;
import '../../modules/authentication/domain/use_cases/login/login_use_case.dart'
    as _i38;
import '../../modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart'
    as _i22;
import '../../modules/authentication/ui/login/view_model/login_view_model.dart'
    as _i39;
import '../../modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart'
    as _i23;
import '../../modules/home/data/api_manager/explore_api_manager.dart' as _i6;
import '../../modules/home/data/data_source_contracts/explore_data_source.dart'
    as _i7;
import '../../modules/home/data/data_source_contracts/questions_offline_data_source.dart'
    as _i16;
import '../../modules/home/data/data_source_imp/explore_data_source_imp.dart'
    as _i8;
import '../../modules/home/data/data_source_imp/questions_offline_data_source_impl.dart'
    as _i17;
import '../../modules/home/data/repository_imp/explore_repository_imp.dart'
    as _i29;
import '../../modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart'
    as _i12;
import '../../modules/home/domain/repositories_contracts/explore_repository.dart'
    as _i28;
import '../../modules/home/domain/use_cases/check_questions.dart' as _i42;
import '../../modules/home/domain/use_cases/get_all_exams_on_subject.dart'
    as _i30;
import '../../modules/home/domain/use_cases/get_all_questions.dart' as _i31;
import '../../modules/home/domain/use_cases/get_all_subjects_use_case.dart'
    as _i32;
import '../../modules/home/domain/use_cases/get_cashed_question.dart' as _i33;
import '../../modules/home/domain/use_cases/save_questions.dart' as _i40;
import '../../modules/home/UI/layouts/explore_layout/view_model/exam/exam_cubit.dart'
    as _i43;
import '../../modules/home/UI/layouts/explore_layout/view_model/exam_score/exam_score_cubit.dart'
    as _i44;
import '../../modules/home/UI/layouts/explore_layout/view_model/explore/explore_cubit.dart'
    as _i45;
import '../../modules/home/UI/layouts/explore_layout/view_model/questions/questions_cubit.dart'
    as _i46;
import '../../modules/home/UI/layouts/result_layout/view%20model/cashed_cubit.dart'
    as _i41;
import '../../storage/contracts/isar_storage_service_contract.dart' as _i11;
import '../../storage/contracts/storage_service_contract.dart' as _i24;
import '../../storage/implementation/isar_storage_service_cashed_question_entity_impl.dart'
    as _i13;
import '../../storage/implementation/storage_service_imp.dart' as _i25;
import '../../storage/initializer/storage_initializer.dart' as _i48;
import '../providers/error/error_notifier.dart' as _i5;

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
    final storageInitializer = _$StorageInitializer();
    final localeInitializer = _$LocaleInitializer();
    gh.lazySingleton<_i3.AuthApiManager>(() => _i3.AuthApiManager());
    await gh.factoryAsync<_i4.Dio>(
      () => dioService.provideDio(),
      preResolve: true,
    );
    gh.singleton<_i5.ErrorNotifier>(() => _i5.ErrorNotifier());
    gh.singleton<_i6.ExploreApiManager>(() => _i6.ExploreApiManager());
    gh.factory<_i7.ExploreDataSource>(
        () => _i8.HomeDataSourceImpl(apiManager: gh<_i6.ExploreApiManager>()));
    await gh.factoryAsync<_i9.FlutterSecureStorage>(
      () => storageInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    await gh.factoryAsync<_i10.Isar>(
      () => storageInitializer.initIsarInstance(),
      preResolve: true,
    );
    gh.factory<_i11.IsarStorageService<_i12.CashedQuestions>>(() =>
        _i13.IsarStorageServiceCashedQuestionEntityImpl(isar: gh<_i10.Isar>()));
    gh.factory<_i14.LoginRemoteDataSource>(() =>
        _i15.LoginRemoteDataSourceImpl(apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i16.QuestionsOfflineDataSource>(() =>
        _i17.QuestionsOfflineDataSourceImpl(
            database: gh<_i11.IsarStorageService<_i12.CashedQuestions>>()));
    gh.factory<_i18.SignUpRemoteDataSource>(() =>
        _i19.SignUpRemoteDataSourceImp(apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i20.SignUpRepository>(() => _i21.SignUpRepositoryImp(
        signUpRemoteDataSource: gh<_i18.SignUpRemoteDataSource>()));
    gh.factory<_i22.SignUpUseCase>(() =>
        _i22.SignUpUseCase(signUpRepository: gh<_i20.SignUpRepository>()));
    gh.factory<_i23.SignUpViewModel>(
        () => _i23.SignUpViewModel(gh<_i22.SignUpUseCase>()));
    gh.singleton<_i24.StorageService<_i9.FlutterSecureStorage>>(
        () => _i25.StorageServiceImp(
              gh<_i5.ErrorNotifier>(),
              gh<_i9.FlutterSecureStorage>(),
            ));
    await gh.factoryAsync<String>(
      () => dioService
          .getToken(gh<_i24.StorageService<_i9.FlutterSecureStorage>>()),
      preResolve: true,
    );
    await gh.factoryAsync<String>(
      () => localeInitializer.initCurrentLocal(
          gh<_i24.StorageService<_i9.FlutterSecureStorage>>()),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    gh.factory<_i26.AuthLocalDataSource>(() => _i27.AuthLocalDataSourceImpl(
        storageService: gh<_i24.StorageService<_i9.FlutterSecureStorage>>()));
    gh.factory<_i28.ExploreRepository>(() => _i29.HomeRepositoryImp(
          homeDataSource: gh<_i7.ExploreDataSource>(),
          questionsOfflineDataSource: gh<_i16.QuestionsOfflineDataSource>(),
        ));
    gh.factory<_i30.GetAllExamsOnSubjectUseCase>(() =>
        _i30.GetAllExamsOnSubjectUseCase(
            homeRepo: gh<_i28.ExploreRepository>()));
    gh.factory<_i31.GetAllQuestionsUseCase>(() =>
        _i31.GetAllQuestionsUseCase(homeRepo: gh<_i28.ExploreRepository>()));
    gh.factory<_i32.GetAllSubjectsUseCase>(
        () => _i32.GetAllSubjectsUseCase(repo: gh<_i28.ExploreRepository>()));
    gh.factory<_i33.GetCashedQuestionUseCase>(() =>
        _i33.GetCashedQuestionUseCase(
            exploreRepository: gh<_i28.ExploreRepository>()));
    gh.singleton<_i34.LocalizationManager>(() => _i34.LocalizationManager(
          gh<_i24.StorageService<_i9.FlutterSecureStorage>>(),
          gh<String>(instanceName: 'initCurrentLocal'),
        ));
    gh.factory<_i35.LocalizationUseCase>(
        () => _i35.LocalizationUseCase(gh<_i34.LocalizationManager>()));
    gh.factory<_i36.LoginRepo>(() => _i37.LoginRepoImpl(
          authRemoteDataSource: gh<_i14.LoginRemoteDataSource>(),
          authLocalDataSource: gh<_i26.AuthLocalDataSource>(),
        ));
    gh.factory<_i38.LoginUseCase>(
        () => _i38.LoginUseCase(authRepo: gh<_i36.LoginRepo>()));
    gh.factory<_i39.LoginViewModel>(
        () => _i39.LoginViewModel(loginUseCase: gh<_i38.LoginUseCase>()));
    gh.factory<_i40.SaveQuestionsUseCase>(() => _i40.SaveQuestionsUseCase(
        exploreRepository: gh<_i28.ExploreRepository>()));
    gh.factory<_i41.CachedQuestionsCubit>(() => _i41.CachedQuestionsCubit(
        getCashedQuestionUseCase: gh<_i33.GetCashedQuestionUseCase>()));
    gh.factory<_i42.CheckQuestionsUseCase>(() => _i42.CheckQuestionsUseCase(
        homeRepository: gh<_i28.ExploreRepository>()));
    gh.factory<_i43.ExamCubit>(() => _i43.ExamCubit(
        getAllExamsOnSubjectUseCase: gh<_i30.GetAllExamsOnSubjectUseCase>()));
    gh.factory<_i44.ExamScoreCubit>(() => _i44.ExamScoreCubit(
        checkQuestionsUseCase: gh<_i42.CheckQuestionsUseCase>()));
    gh.factory<_i45.ExploreCubit>(() => _i45.ExploreCubit(
        getAllSubjectsUseCase: gh<_i32.GetAllSubjectsUseCase>()));
    gh.factory<_i46.QuestionsCubit>(() => _i46.QuestionsCubit(
          getAllQuestionsUseCase: gh<_i31.GetAllQuestionsUseCase>(),
          checkQuestionsUseCase: gh<_i42.CheckQuestionsUseCase>(),
          saveQuestionsUseCase: gh<_i40.SaveQuestionsUseCase>(),
          getCashedQuestionUseCase: gh<_i33.GetCashedQuestionUseCase>(),
        ));
    return this;
  }
}

class _$DioService extends _i47.DioService {}

class _$StorageInitializer extends _i48.StorageInitializer {}

class _$LocaleInitializer extends _i49.LocaleInitializer {}
