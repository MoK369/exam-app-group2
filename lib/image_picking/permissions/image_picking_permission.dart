import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickingPermission {
  static Future<PermissionStatus> askForPermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        return Permission.storage.request();
      }
    }
    return Permission.photos.request();
  }
}
