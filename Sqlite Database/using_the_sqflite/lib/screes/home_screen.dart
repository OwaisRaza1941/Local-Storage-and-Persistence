import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:using_the_sqflite/controller/note_add_controller.dart';
import 'package:using_the_sqflite/data/local/db_helper.dart';
import 'package:using_the_sqflite/screes/widgets/floating_actionbtn.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  // List<Map<String, dynamic>> allnotes = [];
  // DBHelper? dbRef;

  final NoteAddController controller = Get.put(NoteAddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Notes")),

      /// All notes viewed here
      body: controller.allnotes.isNotEmpty
          ? ListView.builder(
              itemCount: controller.allnotes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    "${controller.allnotes[index][DBHelper.column_note_sno]}",
                  ),
                  title: Text(
                    controller.allnotes[index][DBHelper.column_note_title],
                  ),
                  subtitle: Text(
                    controller.allnotes[index][DBHelper.column_note_des],
                  ),
                );
              },
            )
          : Center(child: Text("Note Not Found")),

      floatingActionButton: AddNoteFAB(
        dbRef: controller.dbRef!,
        refreshNotes: controller.getNotes,
      ),
    );
  }
}
