import 'package:flutter/material.dart';
import 'package:using_the_sqflite/components/add_note_fields.dart';
import 'package:using_the_sqflite/data/local/db_helper.dart';
import 'package:get/get.dart';
import 'package:using_the_sqflite/controller/note_add_controller.dart';
import 'package:using_the_sqflite/models/notes_models.dart';

class AddNoteFAB extends StatelessWidget {
  final DBHelper dbRef;
  final VoidCallback refreshNotes;
  final int? index; // 👈 Index of note (for update)
  final bool isUpdate; // 👈 Add or Update mode

  AddNoteFAB({
    required this.dbRef,
    required this.refreshNotes,
    this.index,
    this.isUpdate = false,
    super.key,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  final NoteAddController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        /// Agar update hai to purana data load karo
        if (isUpdate && index != null) {
          titleController.text = controller.allnotes[index!].title.toString();
          desController.text = controller.allnotes[index!].description
              .toString();
        }
        getModelBottomSheet(context, isUpdate: isUpdate, index: index);
      },
      child: Icon(isUpdate ? Icons.edit : Icons.add),
    );
  }

  Future<dynamic> getModelBottomSheet(
    BuildContext context, {
    bool isUpdate = false,
    int? index,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isUpdate ? "Update Note" : "Add Note",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 20),
              addNoteTextFields(
                controller: titleController,
                lableText: " Title ",
                hintText: "Enter title here",
              ),
              SizedBox(height: 20),
              addNoteTextFields(
                controller: desController,
                lableText: " Description ",
                hintText: "Enter description here",
                maxlines: 4,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        var title = titleController.text;
                        var des = desController.text;

                        if (title.isNotEmpty && des.isNotEmpty) {
                          if (isUpdate && index != null) {
                            // 👇 Update existing note
                            NotesModel updateNote = NotesModel(
                              sNo: controller.allnotes[index].sNo,
                              title: title,
                              description: des,
                            );

                            bool check = await dbRef.updateNote(updateNote);
                            if (check) refreshNotes();
                          } else {
                            NotesModel newNote = NotesModel(
                              title: title,
                              description: des,
                            );

                            bool check = await dbRef.addNote(newNote);
                            if (check) refreshNotes();
                          }

                          titleController.clear();
                          desController.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: Text(isUpdate ? "Update Note" : "Add Note"),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
