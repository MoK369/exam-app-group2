// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i8;

import '../../dio_service/dio_service.dart' as _i32;
import '../../localization/initializer/locale_initializer.dart' as _i34;
import '../../localization/l10n_manager/localization_manager.dart' as _i26;
import '../../localization/use_case/localization_use_case.dart' as _i27;
import '../../modules/authentication/data/api_manager/auth_api_manager.dart'
    as _i3;
import '../../modules/authentication/data/data_sources_contracts/auth_local_datasource.dart'
    as _i24;
import '../../modules/authentication/data/data_sources_contracts/login/login_remote_datasource.dart'
    as _i14;
import '../../modules/authentication/data/data_sources_contracts/sign_up/sign_up_remote_data_source.dart'
    as _i16;
import '../../modules/authentication/data/data_sources_imp/auth_local_datasource_impl.dart'
    as _i25;
import '../../modules/authentication/data/data_sources_imp/login/login_remote_data_source_impl.dart'
    as _i15;
import '../../modules/authentication/data/data_sources_imp/sign_up/sign_up_data_source_imp.dart'
    as _i17;
import '../../modules/authentication/data/repositories_imp/login/login_repo_impl.dart'
    as _i29;
import '../../modules/authentication/data/repositories_imp/sign_up/sign_up_repository_imp.dart'
    as _i19;
import '../../modules/authentication/domain/repositories_contracts/login/login_repo.dart'
    as _i28;
import '../../modules/authentication/domain/repositories_contracts/sign_up/sign_up_repository.dart'
    as _i18;
import '../../modules/authentication/domain/use_cases/login/login_use_case.dart'
    as _i30;
import '../../modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart'
    as _i20;
import '../../modules/authentication/ui/login/view_model/login_view_model.dart'
    as _i31;
import '../../modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart'
    as _i21;
import '../../modules/home/data/api_manager/home_api_manager.dart' as _i7;
import '../../modules/home/domain/entities/exam_result_entity.dart' as _i10;
import '../../modules/home/domain/entities/question_entity.dart' as _i12;
import '../../storage/contracts/isar_storage_service_contract.dart' as _i9;
import '../../storage/contracts/storage_service_contract.dart' as _i22;
import '../../storage/implementation/isar_storage_service_exam_result_entity_imp.dart'
    as _i11;
import '../../storage/implementation/isar_storage_service_question_entity_imp.dart'
    as _i13;
import '../../storage/implementation/storage_service_imp.dart' as _i23;
import '../../storage/initializer/storage_initializer.dart' as _i33;
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
    await gh.factoryAsync<_i6.FlutterSecureStorage>(
      () => storageInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    gh.lazySingleton<_i7.HomeApiManager>(() => _i7.HomeApiManager());
    await gh.factoryAsync<_i8.Isar>(
      () => storageInitializer.initIsarInstance(),
      preResolve: true,
    );
    gh.singleton<_i9.IsarStorageService<_i10.ExamResultEntity>>(
        () => _i11.IsarStorageServiceExamResultEntityImp(gh<_i8.Isar>()));
    gh.factory<_i9.IsarStorageService<_i12.QuestionEntity>>(
        () => _i13.IsarStorageServiceQuestionEntityImp(gh<_i8.Isar>()));
    gh.factory<_i14.LoginRemoteDataSource>(() =>
        _i15.LoginRemoteDataSourceImpl(apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i16.SignUpRemoteDataSource>(() =>
        _i17.SignUpRemoteDataSourceImp(apiManager: gh<_i3.AuthApiManager>()));
    gh.factory<_i18.SignUpRepository>(() => _i19.SignUpRepositoryImp(
        signUpRemoteDataSource: gh<_i16.SignUpRemoteDataSource>()));
    gh.factory<_i20.SignUpUseCase>(() =>
        _i20.SignUpUseCase(signUpRepository: gh<_i18.SignUpRepository>()));
    gh.factory<_i21.SignUpViewModel>(
        () => _i21.SignUpViewModel(gh<_i20.SignUpUseCase>()));
    gh.singleton<_i22.StorageService<_i6.FlutterSecureStorage>>(
        () => _i23.StorageServiceImp(
              gh<_i5.ErrorNotifier>(),
              gh<_i6.FlutterSecureStorage>(),
            ));
    await gh.factoryAsync<String>(
      () => localeInitializer.initCurrentLocal(
          gh<_i22.StorageService<_i6.FlutterSecureStorage>>()),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    gh.factory<_i24.AuthLocalDataSource>(() => _i25.AuthLocalDataSourceImpl(
        storageService: gh<_i22.StorageService<_i6.FlutterSecureStorage>>()));
    gh.singleton<_i26.LocalizationManager>(() => _i26.LocalizationManager(
          gh<_i22.StorageService<_i6.FlutterSecureStorage>>(),
          gh<String>(instanceName: 'initCurrentLocal'),
        ));
    gh.factory<_i27.LocalizationUseCase>(
        () => _i27.LocalizationUseCase(gh<_i26.LocalizationManager>()));
    gh.factory<_i28.LoginRepo>(() => _i29.LoginRepoImpl(
          authRemoteDataSource: gh<_i14.LoginRemoteDataSource>(),
          authLocalDataSource: gh<_i24.AuthLocalDataSource>(),
        ));
    gh.factory<_i30.LoginUseCase>(
        () => _i30.LoginUseCase(authRepo: gh<_i28.LoginRepo>()));
    gh.factory<_i31.LoginViewModel>(
        () => _i31.LoginViewModel(loginUseCase: gh<_i30.LoginUseCase>()));
    return this;
  }
}

class _$DioService extends _i32.DioService {}

class _$StorageInitializer extends _i33.StorageInitializer {}

class _$LocaleInitializer extends _i34.LocaleInitializer {}
