import 'package:get/get.dart';
import 'package:using_the_sqflite/data/local/db_helper.dart';

class NoteAddController extends GetxController {
  var allnotes = <Map<String, dynamic>>[].obs;
  DBHelper? dbRef;

  @override
  void onInit() {
    super.onInit();
    dbRef = DBHelper.getInstance;
    getNotes();
  }

  void getNotes() async {
    allnotes.value = await dbRef!.getAllNotes();
  }
}
