import 'package:exam_app_group2/core/providers/error/error_notifier.dart';
import 'package:exam_app_group2/image_picking/constants/image_picking_constants.dart';
import 'package:exam_app_group2/image_picking/contracts/image_picking_service_contract.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ImagePickingService)
class ImagePickingServiceImp implements ImagePickingService {
  final ImagePicker picker;
  final ErrorNotifier errorNotifier;

  ImagePickingServiceImp(this.picker, this.errorNotifier);

  @override
  Future<XFile?> pickImageFromGallery() async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      return image;
    } catch (e) {
      errorNotifier.setError(
          ImagePickingConstants.errorPickingImageFromGallery + e.toString());
      return null;
    }
  }

  @override
  Future<void> saveImageLocallyAsBinary(XFile? imageFile) async {
    if (imageFile == null) {
      errorNotifier.setError(ImagePickingConstants.noImageSelected);
    } else {
      final imageData = await imageFile.readAsBytes();
    }
  }
}
