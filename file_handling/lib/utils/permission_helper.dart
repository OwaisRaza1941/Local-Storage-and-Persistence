import 'package:permission_handler/permission_handler.dart';

Future<void> requeestPermission() async {
  await Permission.storage.request();
  await Permission.photos.request();
}
