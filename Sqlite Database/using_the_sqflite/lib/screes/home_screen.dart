import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:using_the_sqflite/controller/note_add_controller.dart';
import 'package:using_the_sqflite/screes/widgets/floating_actionbtn.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final NoteAddController controller = Get.put(NoteAddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Notes")),

      /// All notes viewed here
      body: Obx(() {
        return controller.allnotes.isNotEmpty
            ? ListView.builder(
                itemCount: controller.allnotes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${[index + 1]}"),
                    title: Text(controller.allnotes[index].title ?? ''),
                    subtitle: Text(
                      controller.allnotes[index].description ?? '',
                    ),
                    trailing: SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              /// 👇 Update mode open karo
                              showModalBottomSheet(
                                context: context,
                                builder: (_) => AddNoteFAB(
                                  dbRef: controller.dbRef!,
                                  refreshNotes: controller.getNotes,
                                  index: index,
                                  isUpdate: true,
                                ),
                              );
                            },
                            child: Icon(Icons.edit),
                          ),
                          InkWell(
                            onTap: () async {
                              await controller.dbRef!.deleteNote(
                                sno: controller.allnotes[index].sNo!,
                              );
                              controller.getNotes();
                            },
                            child: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(child: Text("Note Not Found"));
      }),

      floatingActionButton: AddNoteFAB(
        dbRef: controller.dbRef!,
        refreshNotes: controller.getNotes,
      ),
    );
  }
}
