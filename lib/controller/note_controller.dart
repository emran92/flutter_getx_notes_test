import 'package:flutter/cupertino.dart';
import '../model/notes.dart';
import '../services/db.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {

  @override
  void onReady() {
    getNotes();
    super.onReady();
  }

  // ignore: deprecated_member_use
  final noteModelList = List<NotesModel>().obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController noteTextController = TextEditingController();

  void getNotes() async {
    titleController.text = '';
    noteTextController.text = '';

    List<Map<String, dynamic>> noteList = await DBHelper.query();
    noteModelList.value =
        noteList.map((data) => NotesModel.fromJson(data)).toList();
  }

  Future<void> addNote() async {
    await DBHelper.insert(
        NotesModel(title: titleController.text, note: noteTextController.text));
  }

  Future<void> editNote(id,title,body) async {
    await DBHelper.update(
        NotesModel(id: id, title: title, note: body));
    getNotes();
  }

  void deleteNote(NotesModel notesModel) async{
    await DBHelper.delete(notesModel);
    getNotes();
  }
}
