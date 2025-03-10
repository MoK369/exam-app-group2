import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
import 'package:exam_app_group2/storage/contracts/isar_storage_service_contract.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Injectable(as: IsarStorageService<QuestionEntity>)
class IsarStorageServiceQuestionEntityImp
    implements IsarStorageService<QuestionEntity> {
  Isar isar;

  IsarStorageServiceQuestionEntityImp(this.isar);

  @override
  Future<QuestionEntity?> findBy(String questionId) async {
    return isar.questionEntitys.filter().idEqualTo(questionId).findFirst();
  }

  @override
  Future<List<QuestionEntity>> readAll() {
    return isar.questionEntitys.where().findAll();
  }

  @override
  Future<void> write(QuestionEntity newEntity) async {
    final int count = await isar.questionEntitys.count();
    if (count >= 100) {
      // find oldest entity
      final oldestEntity =
          await isar.questionEntitys.where().anyEntityId().findFirst();
      if (oldestEntity != null) {
        delete(oldestEntity.entityId);
      }
    }
    var existingEntity = await findBy(newEntity.id ?? "");
    if (existingEntity != null) {
      existingEntity.updateEntityWith(newEntity);
      await isar.writeTxn(() async {
        await isar.questionEntitys.put(existingEntity);
      });
    } else {
      await isar.writeTxn(() async {
        await isar.questionEntitys.put(newEntity);
      });
    }
  }

  @override
  Future<void> delete(int id) async {
    await isar.writeTxn(
      () async {
        await isar.questionEntitys.delete(id);
      },
    );
  }
}
