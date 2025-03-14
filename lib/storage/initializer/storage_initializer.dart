import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart';

@module
abstract class StorageInitializer {
  @preResolve
  Future<FlutterSecureStorage> initFlutterSecureStorage() async {
    return FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @preResolve
  Future<Isar> initIsarInstance() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [CashedQuestionsSchema],
      directory: dir.path,
    );
    return isar;
  }
}
