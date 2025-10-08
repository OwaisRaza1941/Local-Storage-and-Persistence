import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileHandler {
  FileHandler._(); // Private constructor
  static final FileHandler instance = FileHandler._();

  Future<String> getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> getLocalFile() async {
    final path = await getFilePath();
    return File('$path/notes.txt');
  }

  Future<void> writeData(String content) async {
    final file = await getLocalFile();
    await file.writeAsString(content);
  }

  Future<String> readData() async {
    try {
      final file = await getLocalFile();
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return 'Error: $e';
    }
  }

  Future<void> deleteFile() async {
    final file = await getLocalFile();
    if (await file.exists()) {
      await file.delete();
    }
  }
}
