import 'package:isar/isar.dart';

part 'image_entity.g.dart';

@collection
class ImageEntity {
  Id id = Isar.autoIncrement;
  List<byte> imageData;

  String emailId;

  ImageEntity({required this.emailId, required this.imageData});

  void updateEntityWith(ImageEntity newEntity) {
    emailId = newEntity.emailId;
    imageData = newEntity.imageData;
  }
}
