import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickingPermission {
  static Future<bool> askForPermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        return await Permission.storage.request() == PermissionStatus.granted;
      } else {
        return await Permission.photos.request() == PermissionStatus.granted;
      }
    } else if (Platform.isIOS) {
      return await Permission.photos.request() == PermissionStatus.granted;
    }
    return false;
  }
}
