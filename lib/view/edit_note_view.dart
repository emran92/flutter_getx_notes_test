import 'package:flutter/material.dart';
import '../controller/note_controller.dart';
import '../model/notes.dart';
import '../utils/styles.dart';
import 'package:get/get.dart';

class EditNoteView extends StatelessWidget {
  final NotesModel notesModel;

  EditNoteView({this.notesModel});

  final NoteController _noteController = Get.put(NoteController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Edit Note',
          style: appFont.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  // controller: _noteController.titleController,
                  initialValue: notesModel.title,
                  decoration: styleTextInputDeco.copyWith(hintText: 'Title'),
                  style: appFont.copyWith(fontSize: 18),
                  validator: (value) {
                    return value.trim().isEmpty
                        ? 'Please give title to note'
                        : null;
                  },
                  onChanged: (value) {
                    notesModel.title = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // controller: _noteController.noteTextController,
                  initialValue: notesModel.note,
                  decoration: styleTextInputDeco.copyWith(hintText: 'Note'),
                  style: appFont.copyWith(fontSize: 18),
                  validator: (value) {
                    return value.trim().isEmpty
                        ? 'Please give description to note'
                        : null;
                  },
                  maxLines: 10,
                  onChanged: (value) {
                    notesModel.note = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      color: colorPrimaryDark,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      'Edit',
                      textAlign: TextAlign.center,
                      style: appFont.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      print(
                          'Note: ${notesModel.id}, ${notesModel.title}, ${notesModel.note}');
                      await _noteController.editNote(
                          notesModel.id, notesModel.title, notesModel.note);
                      Get.back();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
