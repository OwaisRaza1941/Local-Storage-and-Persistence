import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:using_the_sqflite/models/notes_file_model.dart';

class FileHandler {
  ///singletone
  FileHandler._();

  static final FileHandler getInstance = FileHandler._();

  ///get Local Path
  Future<Directory> getLocalPath() async {
    Directory? directory = await getDownloadsDirectory();
    if (await directory!.exists()) {
      directory.create(recursive: true);
    }
    return directory;
  }

  ///get Local File
  Future<File> getLocalFile() async {
    final path = await getLocalPath();
    return File("${path.path}/note.json.txt");
  }

  ///Write Data
  Future<void> writeData(List<NotesFileModel> notes) async {
    try {
      final file = await getLocalFile();

      // Saare notes ko JSON list mein convert kar
      final List<Map<String, dynamic>> jsonList = notes
          .map((e) => e.toJson())
          .toList();

      // JSON encode karo aur likho file mein
      final String content = jsonEncode(jsonList);
      await file.writeAsString(content);

      print("✅ Notes exported successfully!");
    } catch (e) {
      print("❌ Error while writing file: $e");
    }
  }
}
