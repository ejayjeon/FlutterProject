// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_note/data/data_source/note_db_helper.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:flutter_note/main.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // sqfliteFfiInit();
  testWidgets('Testing...', (WidgetTester tester) async {
    sqfliteFfiInit();
    var db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    expect(await db.getVersion(), 0);
    await db.close();
    // await db.execute(
    //   'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)',
    // );

    // final noteDbHelper = NoteDBHelper(db);
    // await noteDbHelper.insertNote(
    //   Note(
    //     title: 'test title',
    //     content: 'test content',
    //     color: 0xffff,
    //     timestamp: 20230505,
    //     id: 1,
    //   ),
    // );
    // expect((await noteDbHelper.getNotes()).length, 1);
    // await db.close();
  });
}
