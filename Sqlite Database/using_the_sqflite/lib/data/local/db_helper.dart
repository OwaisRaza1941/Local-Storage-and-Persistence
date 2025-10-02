import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  ///singletone
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  ///table note
  static final String table_note = "note";
  static final String column_note_sno = "s_no";
  static final String column_note_title = "title";
  static final String column_note_des = "desc";

  Database? myDB;

  /// db Open (path -> if exits then open else create db
  Future<Database> getDB() async {
    myDB ??= await openDB();
    return myDB!;

    // if (myDB != null) {
    //   return myDB!;
    // } else {
    //   myDB = await openDB();
    //   return myDB!;
    // }
  }

  Future<Database> openDB() async {
    Directory dirPath = await getApplicationDocumentsDirectory();

    String dbPath = join(dirPath.path, "noteDB.db");

    return await openDatabase(
      dbPath,
      onCreate: (db, version) {
        /// create all your tables here
        db.execute(
          "create table $table_note ($column_note_sno integer primary key autoincrement , $column_note_title text, $column_note_des text)",
        );

        ///
        ///
        ///
        ///
        ///
      },
      version: 1,
    );
  }

  /// all queries
  /// insertion

  Future<bool> addNote({required String mTitle, required String mDes}) async {
    var db = await getDB();

    int rowsEffected = await db.insert(table_note, {
      column_note_title: mTitle,
      column_note_des: mDes,
    });

    return rowsEffected > 0;
  }

/// Reading all data
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();

    List<Map<String, dynamic>> mData = await db.query(table_note);

    return mData;
  }
}


