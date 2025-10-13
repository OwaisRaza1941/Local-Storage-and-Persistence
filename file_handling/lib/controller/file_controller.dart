import 'package:file_handling/data/local/file_handler.dart';
import 'package:file_handling/models/notes_models.dart';
import 'package:file_handling/utils/permission_helper.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  RxList<NotesModel> allNotes = <NotesModel>[].obs;

  final FileHandler fileHandler = FileHandler.getInstance;

  Future<void> loadData() async {
    final data = await fileHandler.readData();
    allNotes.value = data;
  }

  Future<void> saveNotes({required String mTitle, required String mDes}) async {
    if (mTitle.isEmpty || mDes.isEmpty) return;

    final note = NotesModel(title: mTitle, description: mDes);

    await fileHandler.writeData(note: note);
    await loadData();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await requeestPermission();
    await loadData();
  }
}
