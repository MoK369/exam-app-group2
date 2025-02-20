// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../dio_service/dio_service.dart' as _i73;
import '../localization/l10n_manager/localization_manager.dart' as _i141;
import '../modules/authentication/data/api_manager/api_manager.dart' as _i750;
import '../modules/authentication/domain/use_cases/localization/localization_use_case.dart'
    as _i888;

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
    gh.singleton<_i73.DioService>(() => _i73.DioService());
    gh.singleton<_i141.LocalizationManager>(() => _i141.LocalizationManager());
    gh.factory<_i750.ApiManager>(() => _i750.ApiManager(gh<_i73.DioService>()));
    gh.factory<_i888.LocalizationUseCase>(
        () => _i888.LocalizationUseCase(gh<_i141.LocalizationManager>()));
    return this;
  }
}
