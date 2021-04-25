import '../model/notes.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {


  static Database _database;
  static final int _version = 1;
  static final String _tableName = 'notes';


  static Future<void> initDb() async {
    if (_database != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'notes.db';
      _database =
      await openDatabase(_path, version: _version, onCreate: (db, version) {

        final _sql = "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY,title STRING, note TEXT)";
        return db.execute(_sql);
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(NotesModel notesModel) async{
    return await _database.insert(_tableName, notesModel.toJson());
  }

  static Future<int> delete(NotesModel notesModel) async{
    return await _database.delete(_tableName, where:'id=?',whereArgs: [notesModel.id]);
  }
  static Future<int> update(NotesModel notesModel) async{
    return await _database.update(_tableName, notesModel.toJson(), where:'id = ?',whereArgs: [notesModel.id]);
  }

  static Future<List<Map<String,dynamic>>> query() async{
    return await _database.query(_tableName);
  }


}