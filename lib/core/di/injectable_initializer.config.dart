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
import '../../modules/home/data/api_manager/explore_api_manager.dart' as _i696;
import '../../modules/home/data/data_source_contracts/explore_data_source.dart'
    as _i940;
import '../../modules/home/data/data_source_imp/explore_data_source_imp.dart'
    as _i77;
import '../../modules/home/data/repository_imp/explore_repository_imp.dart'
    as _i999;
import '../../modules/home/domain/repositories_contracts/explore_repository.dart'
    as _i951;
import '../../modules/home/domain/use_cases/check_questions.dart' as _i811;
import '../../modules/home/domain/use_cases/get_all_exams_on_subject.dart'
    as _i369;
import '../../modules/home/domain/use_cases/get_all_questions.dart' as _i370;
import '../../modules/home/domain/use_cases/get_all_subjects_use_case.dart'
    as _i818;
import '../../modules/home/UI/layouts/explore_layout/view_model/exam/exam_cubit.dart'
    as _i313;
import '../../modules/home/UI/layouts/explore_layout/view_model/explore/explore_cubit.dart'
    as _i746;
import '../../modules/home/UI/layouts/explore_layout/view_model/questions/questions_cubit.dart'
    as _i563;
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
    final dioService = _$DioService();
    final storageInitializer = _$StorageInitializer();
    final localeInitializer = _$LocaleInitializer();
    await gh.factoryAsync<_i361.Dio>(
      () => dioService.provideDio(),
      preResolve: true,
    );
    await gh.factoryAsync<_i558.FlutterSecureStorage>(
      () => storageInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    gh.singleton<_i393.ErrorNotifier>(() => _i393.ErrorNotifier());
    gh.singleton<_i696.ExploreApiManager>(() => _i696.ExploreApiManager());
    gh.lazySingleton<_i208.AuthApiManager>(() => _i208.AuthApiManager());
    gh.factory<_i186.SignUpRemoteDataSource>(() =>
        _i522.SignUpRemoteDataSourceImp(
            apiManager: gh<_i208.AuthApiManager>()));
    gh.factory<_i940.ExploreDataSource>(() =>
        _i77.HomeDataSourceImpl(apiManager: gh<_i696.ExploreApiManager>()));
    gh.factory<_i422.LoginRemoteDataSource>(() =>
        _i712.LoginRemoteDataSourceImpl(
            apiManager: gh<_i208.AuthApiManager>()));
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
    gh.factory<_i951.ExploreRepository>(() =>
        _i999.HomeRepositoryImp(homeDataSource: gh<_i940.ExploreDataSource>()));
    gh.factory<_i1011.SignUpRepository>(() => _i1059.SignUpRepositoryImp(
        signUpRemoteDataSource: gh<_i186.SignUpRemoteDataSource>()));
    gh.singleton<_i375.LocalizationManager>(() => _i375.LocalizationManager(
          gh<_i70.StorageService<_i558.FlutterSecureStorage>>(),
          gh<String>(instanceName: 'initCurrentLocal'),
        ));
    gh.factory<_i818.GetAllSubjectsUseCase>(
        () => _i818.GetAllSubjectsUseCase(repo: gh<_i951.ExploreRepository>()));
    gh.factory<_i369.GetAllExamsOnSubjectUseCase>(() =>
        _i369.GetAllExamsOnSubjectUseCase(
            homeRepo: gh<_i951.ExploreRepository>()));
    gh.factory<_i370.GetAllQuestionsUseCase>(() =>
        _i370.GetAllQuestionsUseCase(homeRepo: gh<_i951.ExploreRepository>()));
    gh.factory<_i74.AuthLocalDataSource>(() => _i907.AuthLocalDataSourceImpl(
        storageService: gh<_i70.StorageService<_i558.FlutterSecureStorage>>()));
    gh.factory<_i811.CheckQuestionsUseCase>(() => _i811.CheckQuestionsUseCase(
        homeRepository: gh<_i951.ExploreRepository>()));
    gh.factory<_i367.SignUpUseCase>(() =>
        _i367.SignUpUseCase(signUpRepository: gh<_i1011.SignUpRepository>()));
    gh.factory<_i313.ExamCubit>(() => _i313.ExamCubit(
        getAllExamsOnSubjectUseCase: gh<_i369.GetAllExamsOnSubjectUseCase>()));
    gh.factory<_i746.ExploreCubit>(() => _i746.ExploreCubit(
        getAllSubjectsUseCase: gh<_i818.GetAllSubjectsUseCase>()));
    gh.factory<_i399.SignUpViewModel>(
        () => _i399.SignUpViewModel(gh<_i367.SignUpUseCase>()));
    gh.factory<_i964.LocalizationUseCase>(
        () => _i964.LocalizationUseCase(gh<_i375.LocalizationManager>()));
    gh.factory<_i450.LoginRepo>(() => _i914.LoginRepoImpl(
          authRemoteDataSource: gh<_i422.LoginRemoteDataSource>(),
          authLocalDataSource: gh<_i74.AuthLocalDataSource>(),
        ));
    gh.factory<_i543.LoginUseCase>(
        () => _i543.LoginUseCase(authRepo: gh<_i450.LoginRepo>()));
    gh.factory<_i563.QuestionsCubit>(() => _i563.QuestionsCubit(
          getAllQuestionsUseCase: gh<_i370.GetAllQuestionsUseCase>(),
          checkQuestionsUseCase: gh<_i811.CheckQuestionsUseCase>(),
        ));
    gh.factory<_i108.LoginViewModel>(
        () => _i108.LoginViewModel(loginUseCase: gh<_i543.LoginUseCase>()));
    return this;
  }
}

class _$DioService extends _i678.DioService {}

class _$StorageInitializer extends _i661.StorageInitializer {}

class _$LocaleInitializer extends _i852.LocaleInitializer {}
