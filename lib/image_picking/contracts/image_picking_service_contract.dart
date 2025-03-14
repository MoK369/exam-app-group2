import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

abstract interface class ImagePickingService {
  Future<XFile?> pickImageFromGallery(String widgetName);

  Future<void> saveImageLocallyAsBinary(
      {XFile? imageFile, required String emailId, required String widgetName});

  Future<Uint8List?> getImageBytes(String emailId);

  Future<void> updateImageEmailId(
      {required String oldEmailId, required String newEmailId});
}
