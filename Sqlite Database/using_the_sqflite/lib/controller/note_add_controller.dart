import 'package:get/get.dart';
import 'package:using_the_sqflite/data/local/db_helper.dart';
import 'package:using_the_sqflite/data/local/file_handler.dart';
import 'package:using_the_sqflite/models/notes_file_model.dart';
import 'package:using_the_sqflite/models/notes_models.dart';

class NoteAddController extends GetxController {
  var allnotes = <NotesModel>[].obs;
  DBHelper? dbRef;
  FileHandler? fileRef;

  var isLoading = false.obs;
  var isSuccess = false.obs;

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

  /// ✅ This function now also controls loader and success state
  Future<void> writeFileNoteWithStatus() async {
    try {
      isLoading.value = true;
      isSuccess.value = false;

      var rawData = await dbRef!.getAllNotes();
      final notesFile = rawData.map((e) => NotesFileModel.fromJson(e)).toList();

      await fileRef!.writeData(notesFile);

      // simulate saving delay
      await Future.delayed(Duration(seconds: 2));

      isLoading.value = false;
      isSuccess.value = true;

      await Future.delayed(Duration(seconds: 2));
      isSuccess.value = false;
    } catch (e) {
      isLoading.value = false;
      isSuccess.value = false;
      print("❌ Error while saving file: $e");
    }
  }
}
