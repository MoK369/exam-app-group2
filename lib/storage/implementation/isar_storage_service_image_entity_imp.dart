import 'package:exam_app_group2/modules/edit_profile/domain/entities/image_entity/image_entity.dart';
import 'package:exam_app_group2/storage/contracts/isar_storage_service_contract.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Injectable(as: IsarStorageService<ImageEntity>)
class IsarStorageServiceQuestionEntityImp
    implements IsarStorageService<ImageEntity> {
  Isar isar;

  IsarStorageServiceQuestionEntityImp(this.isar);

  @override
  Future<ImageEntity?> findBy(String emailId) async {
    return isar.imageEntitys.filter().emailIdEqualTo(emailId).findFirst();
  }

  @override
  Future<void> write(ImageEntity newEntity) async {
    final int count = await isar.imageEntitys.count();
    if (count >= 5) {
      // find oldest entity
      final oldestEntity = await isar.imageEntitys.where().anyId().findFirst();
      if (oldestEntity != null) {
        delete(oldestEntity.id);
      }
    }
    var existingEntity = await findBy(newEntity.emailId);
    if (existingEntity != null) {
      existingEntity.updateEntityWith(newEntity);
      await isar.writeTxn(() async {
        await isar.imageEntitys.put(existingEntity);
      });
    } else {
      await isar.writeTxn(() async {
        await isar.imageEntitys.put(newEntity);
      });
    }
  }

  @override
  Future<void> delete(int id) async {
    await isar.writeTxn(
      () async {
        await isar.imageEntitys.delete(id);
      },
    );
  }

  @override
  Future<void> updateEmail(String emailId) async {
    var existingEntity = await findBy(emailId);
    if (existingEntity != null) {
      existingEntity.emailId = emailId;
      await isar.writeTxn(() async {
        await isar.imageEntitys.put(existingEntity);
      });
    }
  }
}
