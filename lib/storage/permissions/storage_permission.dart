import 'package:permission_handler/permission_handler.dart';

class StoragePermission {
  static Future<PermissionStatus> askForPermission() async {
    var status = await Permission.storage.request();
    return status;
  }
}
