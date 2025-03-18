import 'package:exam_app_group2/modules/edit_profile/domain/entities/image_entity/image_entity.dart';

abstract interface class IsarStorageServiceImageEntity<T> {
  Future<T?> findBy(String id);

  Future<void> write(ImageEntity imageEntity);

  Future<void> updateEmail(
      {required String oldEmailId, required String newEmailId});

  Future<void> delete(int id);
}
