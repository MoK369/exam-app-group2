import 'dart:typed_data';

import 'package:exam_app_group2/dio_service/dio_service.dart';
import 'package:exam_app_group2/image_picking/contracts/image_picking_service_contract.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  AvatarState avatarState = AvatarState();
  ImagePickingService imagePickingService;

  HomeViewModel(this.imagePickingService) {
    getAvatarImage(authEntity.user?.email ?? "");
  }

  void updateDioWithToken(String token) {
    DioServiceExtension.updateDioWithToken(token);
  }

  Future<void> getAvatarImage(String email) async {
    avatarState.avatarLoading = true;
    notifyListeners();
    final imageBytes = await imagePickingService.getImageBytes(email);
    if (imageBytes != null) {
      avatarState.avatarImage = imageBytes;
    }
    avatarState.avatarLoading = false;
    notifyListeners();
  }
}

class AvatarState {
  Uint8List? avatarImage;
  bool avatarLoading;

  AvatarState({this.avatarImage, this.avatarLoading = false});
}
