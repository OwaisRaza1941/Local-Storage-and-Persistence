import 'package:get/get.dart';
import 'package:using_the_sqflite/data/local/db_helper.dart';
import 'package:using_the_sqflite/models/notes_models.dart';

class NoteAddController extends GetxController {
  var allnotes = <NotesModel>[].obs;
  DBHelper? dbRef;

  @override
  void onInit() {
    super.onInit();
    dbRef = DBHelper.getInstance;
    getNotes();
  }

  void getNotes() async {
    var rawData = await dbRef!.getAllNotes();
    allnotes.value = rawData.map((e) => NotesModel.fromMap(e)).toList();
  }
}
