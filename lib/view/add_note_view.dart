import 'package:flutter/material.dart';
import '../controller/note_controller.dart';
import '../utils/styles.dart';
import 'package:get/get.dart';

class AddNoteView extends StatelessWidget {
  final NoteController _noteController = Get.find<NoteController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Add Note',
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
                  controller: _noteController.titleController,
                  decoration: styleTextInputDeco.copyWith(hintText: 'Title'),
                  style: appFont.copyWith(fontSize: 18),
                  validator: (value) {
                    return value.trim().isEmpty
                        ? 'Please give title to note'
                        : null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _noteController.noteTextController,
                  decoration: styleTextInputDeco.copyWith(hintText: 'Note'),
                  style: appFont.copyWith(fontSize: 18),
                  validator: (value) {
                    return value.trim().isEmpty
                        ? 'Please give description to note'
                        : null;
                  },
                  maxLines: 10,
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
                      'Save',
                      textAlign: TextAlign.center,
                      style: appFont.copyWith(fontWeight: FontWeight.w500,color: Colors.white),
                    ),
                  ),
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      await _noteController.addNote();
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
