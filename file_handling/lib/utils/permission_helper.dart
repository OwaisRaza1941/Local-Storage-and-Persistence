import 'package:permission_handler/permission_handler.dart';

requestPermission() async {
  await Permission.storage.request();
  await Permission.photos.request();
}
