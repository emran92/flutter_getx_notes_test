import 'package:flutter/material.dart';
import '../controller/note_controller.dart';
import '../utils/styles.dart';
import '../view/add_note_view.dart';
import '../view/edit_note_view.dart';
import 'package:get/get.dart';
import 'package:random_color/random_color.dart';

class NotesView extends StatelessWidget {
  final _noteController = Get.put(NoteController());
  final RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Notes',
          style: appFont.copyWith(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Get.to(() => AddNoteView());
          _noteController.getNotes();
        },
        backgroundColor: colorPrimaryDark,
        label: Text(
          'Add Note',
          style: appFont.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Obx(
          () => ListView.builder(
            itemCount: _noteController.noteModelList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  child: Text(
                    _noteController.noteModelList[index].title,
                    style: appFont.copyWith(fontWeight: FontWeight.bold,fontSize: 18,color: _randomColor.randomColor()),
                  ),
                ),
                subtitle: Container(
                  child: Text(
                    _noteController.noteModelList[index].note,
                    style: appFont.copyWith(fontWeight: FontWeight.normal,fontSize: 14,color: _randomColor.randomColor()),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Get.to(() => EditNoteView(notesModel: _noteController.noteModelList[index],));
                      },
                    ),
                    IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        _noteController.deleteNote(_noteController.noteModelList[index]);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
