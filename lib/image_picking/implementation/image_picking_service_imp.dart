import 'dart:typed_data';

import 'package:exam_app_group2/core/providers/error/error_notifier.dart';
import 'package:exam_app_group2/image_picking/constants/image_picking_constants.dart';
import 'package:exam_app_group2/image_picking/contracts/image_picking_service_contract.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/image_entity/image_entity.dart';
import 'package:exam_app_group2/storage/contracts/isar_storage_service_contract.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ImagePickingService)
class ImagePickingServiceImp implements ImagePickingService {
  final ImagePicker picker;
  final ErrorNotifier errorNotifier;
  final IsarStorageService<ImageEntity> isarImageStorageService;

  ImagePickingServiceImp(
      this.picker, this.errorNotifier, this.isarImageStorageService);

  @override
  Future<XFile?> pickImageFromGallery(String widgetName) async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      return image;
    } catch (e) {
      errorNotifier.setError(
          message:
              ImagePickingConstants.errorPickingImageFromGallery + e.toString(),
          widgetName: widgetName);
      return null;
    }
  }

  @override
  Future<void> saveImageLocallyAsBinary({XFile? imageFile,
    required String emailId,
    required String widgetName}) async {
    if (imageFile == null) {
      errorNotifier.setError(
          message: ImagePickingConstants.noImageSelected,
          widgetName: widgetName);
    } else {
      final imageData = (await imageFile.readAsBytes()).toList();
      isarImageStorageService
          .write(ImageEntity(imageData: imageData, emailId: emailId));
    }
  }

  @override
  Future<Uint8List?> getImageBytes(String emailId) async {
    final imageBytes = await isarImageStorageService.findBy(emailId);
    if (imageBytes?.imageData != null) {
      return Uint8List.fromList(imageBytes!.imageData);
    }
    return null;
  }

  @override
  Future<void> updateImageEmailId(
      {required String oldEmailId, required String newEmailId}) {
    return isarImageStorageService.updateEmail(
        oldEmailId: oldEmailId, newEmailId: newEmailId);
  }
}
