import 'package:photo_manager/photo_manager.dart';
import 'package:permission_handler/permission_handler.dart';

// get permission for gallery image
Future<bool> getGalleryPermission() async {
  var result = await PhotoManager.requestPermissionExtend();
  if (result.isAuth) {
    return true;
  } else {
    return false;
  }
}

// get permission for camera
Future<bool> getCameraPermission() async{
  final status = await Permission.camera.request();
  if (status == PermissionStatus.granted) {
    return true;
  } else if (status == PermissionStatus.denied) {
    return false;
  } else if (status == PermissionStatus.permanentlyDenied) {
    return false;
  } else {
    return false;
  }
}

// get permission for storage
Future<bool> getStoragePermission() async{
  final status = await Permission.storage.request();
  if (status == PermissionStatus.granted) {
    return true;
  } else if (status == PermissionStatus.denied) {
    return false;
  } else if (status == PermissionStatus.permanentlyDenied) {
    return false;
  } else {
    return false;
  }
}