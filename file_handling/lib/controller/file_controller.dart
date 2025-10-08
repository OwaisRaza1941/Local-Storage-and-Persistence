import 'package:file_handling/utils/permission_helper.dart';
import 'package:get/get.dart';
import 'package:file_handling/data/local/file_handler.dart';

class FileController extends GetxController {
  var noteText = ''.obs; // reactive variable for showing text

  Future<void> saveText({required String text}) async {
    await FileHandler.instance.writeData(text);
  }

  Future<void> readText() async {
    String data = await FileHandler.instance.readData();
    noteText.value = data;
  }

  @override
  void onInit() {
    super.onInit();
    requestPermission();
  }
}
