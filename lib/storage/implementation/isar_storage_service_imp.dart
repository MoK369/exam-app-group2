import 'package:exam_app_group2/modules/home/domain/entities/check_question_entity.dart';
import 'package:exam_app_group2/storage/contracts/isar_storage_service_contract.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Singleton(as: IsarStorageService<CheckQuestionEntity>)
class IsarStorageServiceImp implements IsarStorageService<CheckQuestionEntity> {
  Isar isar;

  IsarStorageServiceImp(this.isar);

  @override
  Future<void> write(object) async {
    await isar.writeTxn(() async {
      await isar.checkQuestionEntitys.put(object);
    });
  }

  @override
  Future<List<CheckQuestionEntity>> getAllObjects() {
    return isar.checkQuestionEntitys.where().findAll();
  }
}
