import 'package:exam_app_group2/modules/home/domain/entities/exam_result_entity.dart';
import 'package:exam_app_group2/storage/contracts/isar_storage_service_contract.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Singleton(as: IsarStorageService<ExamResultEntity>)
class IsarStorageServiceExamResultEntityImp
    implements IsarStorageService<ExamResultEntity> {
  Isar isar;

  IsarStorageServiceExamResultEntityImp(this.isar);

  @override
  Future<void> write(newEntity) async {
    var existingEntity = await findBy(newEntity.examId ?? "");
    if (existingEntity != null) {
      existingEntity.updateEntityWith(newEntity);
      await isar.writeTxn(
        () async {
          await isar.examResultEntitys.put(existingEntity);
        },
      );
    } else {
      await isar.writeTxn(() async {
        await isar.examResultEntitys.put(newEntity);
      });
    }
  }

  @override
  Future<ExamResultEntity?> findBy(String examId) {
    return isar.examResultEntitys.filter().examIdEqualTo(examId).findFirst();
  }

  @override
  Future<List<ExamResultEntity>> readAll() {
    return isar.examResultEntitys.where().findAll();
  }
}
