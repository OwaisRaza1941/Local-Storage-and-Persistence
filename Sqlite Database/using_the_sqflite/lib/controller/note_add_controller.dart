import 'package:get/get.dart';
import 'package:using_the_sqflite/data/local/db_helper.dart';
import 'package:using_the_sqflite/data/local/file_handler.dart';
import 'package:using_the_sqflite/models/notes_file_model.dart';
import 'package:using_the_sqflite/models/notes_models.dart';

class NoteAddController extends GetxController {
  var allnotes = <NotesModel>[].obs;
  DBHelper? dbRef;
  FileHandler? fileRef;

  @override
  void onInit() {
    super.onInit();
    dbRef = DBHelper.getInstance;
    fileRef = FileHandler.getInstance;
    getNotes();
  }

  void getNotes() async {
    var rawData = await dbRef!.getAllNotes();
    allnotes.value = rawData.map((e) => NotesModel.fromMap(e)).toList();
  }

  Future<void> writeFileNote() async {
    var rawData = await dbRef!.getAllNotes();
    final notesFile = rawData.map((e) => NotesFileModel.fromJson(e)).toList();
    await fileRef!.writeData(notesFile);
  }
}
