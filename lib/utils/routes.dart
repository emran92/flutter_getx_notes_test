import '../view/add_note_view.dart';
import '../view/edit_note_view.dart';
import '../view/notes_view.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(name: '/notes', page: () => NotesView()),
    GetPage(name: '/addNote', page: () => AddNoteView()),
    GetPage(name: '/editNote', page: () => EditNoteView()),
  ];
}
