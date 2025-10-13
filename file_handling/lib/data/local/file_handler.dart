import 'dart:convert';
import 'dart:io';
import 'package:file_handling/models/notes_models.dart';
import 'package:path_provider/path_provider.dart';

class FileHandler {
  /// singletone
  FileHandler._();

  // List<NotesModel> notes = [];

  static final FileHandler getInstance = FileHandler._();

  /// getLocalPath
  Future<Directory> getLocalPath() async {
    Directory? directory = await getDownloadsDirectory();
    if (await directory!.exists()) {
      directory.create(recursive: true);
    }
    return directory;
  }

  /// getLoclFile
  Future<File> getLocalFile() async {
    final path = await getLocalPath();
    return File("${path.path}/note.json.txt");
  }

  /// writeData
  Future<void> writeData({required NotesModel note}) async {
    try {
      final file = await getLocalFile();

      List<NotesModel> oldNotes = await readData();
      oldNotes.add(note);

      List<Map<String, dynamic>> notesMap = oldNotes
          .map((n) => n.toJson())
          .toList();

      await file.writeAsString(jsonEncode(notesMap));
      print("✅ Saved successfully at: ${file.path}");
    } catch (e) {
      print("❌ Error while writing file: $e");
    }
  }

  /// Read Data
  Future<List<NotesModel>> readData() async {
    try {
      final file = await getLocalFile();
      if (!await file.exists()) {
        return [];
      }

      String content = await file.readAsString();

      if (content.isEmpty) {
        return [];
      }

      List<dynamic> jsonList = jsonDecode(content);

      return jsonList.map((json) => NotesModel.fromJson(json)).toList();
    } catch (e) {
      print("❌ Error while reading file: $e");
      return [];
    }
  }

  //   //   Future<void> deleteFile() async {
  //   //     final file = await getLocalFile();
  //   //     if (await file.exists()) {
  //   //       await file.delete();
  //   //     }
  //   //   }
}
