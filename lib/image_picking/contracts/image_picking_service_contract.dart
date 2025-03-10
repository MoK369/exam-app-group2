import 'package:image_picker/image_picker.dart';

abstract interface class ImagePickingService {
  Future<XFile?> pickImageFromGallery();

  Future<void> saveImageLocallyAsBinary(XFile? imageFile);
}
