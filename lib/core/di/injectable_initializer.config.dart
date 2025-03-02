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
import '../../localization/l10n_manager/localization_manager.dart' as _i375;
import '../../modules/authentication/data/api_manager/api_manager.dart'
    as _i355;
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
import '../../modules/authentication/domain/repositories_constracts/login/login_repo.dart'
    as _i145;
import '../../modules/authentication/domain/repositories_constracts/sign_up/sign_up_repository.dart'
    as _i745;
import '../../modules/authentication/domain/use_cases/localization/localization_use_case.dart'
    as _i618;
import '../../modules/authentication/domain/use_cases/login/login_use_case.dart'
    as _i543;
import '../../modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart'
    as _i367;
import '../../modules/authentication/ui/login/view_model/login_cubit.dart'
    as _i953;
import '../../modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart'
    as _i399;
import '../../modules/home/data/api_manager/home_api_manager.dart' as _i945;
import '../../modules/home/data/datasource_contract/home_data_source_contract.dart'
    as _i826;
import '../../modules/home/data/datasource_impl/home_data_source_impl.dart'
    as _i524;
import '../../modules/home/data/repo_impl/home_repo_impl.dart' as _i1042;
import '../../modules/home/domain/repo_contract/home_repo_contract.dart'
    as _i542;
import '../../modules/home/domain/use_cases/get_all_exams_on_subject.dart'
    as _i369;
import '../../modules/home/domain/use_cases/get_all_questions.dart' as _i370;
import '../../modules/home/domain/use_cases/get_all_subjects_use_case.dart'
    as _i818;
import '../../modules/home/UI/view_model/exam/exam_cubit.dart' as _i319;
import '../../modules/home/UI/view_model/home/home_cubit.dart' as _i942;
import '../../modules/home/UI/view_model/questions/questions_cubit.dart'
    as _i399;
import '../../storage/contracts/storage_service_contract.dart' as _i70;
import '../../storage/implementation/storage_service.dart' as _i313;

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
    gh.singleton<_i375.LocalizationManager>(() => _i375.LocalizationManager());
    gh.singleton<_i355.ApiManager>(() => _i355.ApiManager());
    gh.singleton<_i945.HomeApiManager>(() => _i945.HomeApiManager());
    gh.factory<_i186.SignUpRemoteDataSource>(() =>
        _i522.SignUpRemoteDataSourceImp(apiManager: gh<_i355.ApiManager>()));
    gh.factory<_i422.LoginRemoteDataSource>(() =>
        _i712.LoginRemoteDataSourceImpl(apiManager: gh<_i355.ApiManager>()));
    gh.factory<_i826.HomeDataSource>(
        () => _i524.HomeDataSourceImpl(apiManager: gh<_i945.HomeApiManager>()));
    gh.singleton<_i70.StorageService<_i558.FlutterSecureStorage>>(
        () => _i313.StorageServiceImp());
    gh.factory<_i745.SignUpRepository>(() => _i1059.SignUpRepositoryImp(
        signUpRemoteDataSource: gh<_i186.SignUpRemoteDataSource>()));
    gh.factory<_i618.LocalizationUseCase>(
        () => _i618.LocalizationUseCase(gh<_i375.LocalizationManager>()));
    gh.factory<_i542.HomeRepo>(
        () => _i1042.HomeRepoImpl(homeDataSource: gh<_i826.HomeDataSource>()));
    gh.factory<_i369.GetAllExamsOnSubjectUseCase>(() =>
        _i369.GetAllExamsOnSubjectUseCase(homeRepo: gh<_i542.HomeRepo>()));
    gh.factory<_i370.GetAllQuestionsUseCase>(
        () => _i370.GetAllQuestionsUseCase(homeRepo: gh<_i542.HomeRepo>()));
    gh.factory<_i818.GetAllSubjectsUseCase>(
        () => _i818.GetAllSubjectsUseCase(repo: gh<_i542.HomeRepo>()));
    gh.factory<_i74.AuthLocalDataSource>(() => _i907.AuthLocalDataSourceImpl(
        storageService: gh<_i70.StorageService<_i558.FlutterSecureStorage>>()));
    gh.factory<_i367.SignUpUseCase>(() =>
        _i367.SignUpUseCase(signUpRepository: gh<_i745.SignUpRepository>()));
    gh.factory<_i319.ExamCubit>(() => _i319.ExamCubit(
        getAllExamsOnSubjectUseCase: gh<_i369.GetAllExamsOnSubjectUseCase>()));
    gh.factory<_i942.HomeCubit>(() => _i942.HomeCubit(
        getAllSubjectsUseCase: gh<_i818.GetAllSubjectsUseCase>()));
    gh.factory<_i399.SignUpViewModel>(
        () => _i399.SignUpViewModel(gh<_i367.SignUpUseCase>()));
    gh.factory<_i145.LoginRepo>(() => _i914.LoginRepoImpl(
          authRemoteDataSource: gh<_i422.LoginRemoteDataSource>(),
          authLocalDataSource: gh<_i74.AuthLocalDataSource>(),
        ));
    gh.factory<_i399.QuestionsCubit>(() => _i399.QuestionsCubit(
        getAllQuestionsUseCase: gh<_i370.GetAllQuestionsUseCase>()));
    gh.factory<_i543.LoginUseCase>(
        () => _i543.LoginUseCase(authRepo: gh<_i145.LoginRepo>()));
    gh.factory<_i953.LoginCubit>(
        () => _i953.LoginCubit(loginUseCase: gh<_i543.LoginUseCase>()));
    return this;
  }
}

class _$DioService extends _i678.DioService {}
