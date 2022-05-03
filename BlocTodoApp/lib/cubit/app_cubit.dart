import 'package:dayxday/cubit/app_states.dart';
import 'package:dayxday/widgets/archived_tasks_page.dart';
import 'package:dayxday/widgets/done_tasks_page.dart';
import 'package:dayxday/widgets/new_tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  int bottomNavigationIndex = 0;
  List<Widget> screens = [NewTasksPage(), DoneTasksPage(), ArchivedTasksPage()];
  Database? database;
  List<String> titles = ['Todo Tasks', 'Done Tasks', 'Archived Tasks'];
  bool isBottomSheetShown = false;
  Icon floatingButtonIcon = Icon(Icons.edit);

  void changeIndex(int? index) {
    bottomNavigationIndex = index!;
    emit(AppChangeBottomNavBarState());
  }

  void getDataBase(database) async {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'New') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });
  }

  void updateDatabase(String? status, int id) async {
    database!.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getDataBase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteFromDatabase(int id) async {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataBase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) => print('Table Created'))
            .catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataBase(database);
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  inserToDatabase(
      {required String title,
      required String time,
      required String date}) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks (title, date, time, status) VALUES ("$title","$date","$time","New")')
          .then((value) {
        getDataBase(database);
        print('$value Inserted Successfully');
        emit(AppInsertDatabaseState());
      }).catchError((error) {
        print('Error When inserting Table ${error.toString()}');
      });
    });
  }

  void changeBottomSheetState(bool isShow, Icon icon) {
    isBottomSheetShown = isShow;
    floatingButtonIcon = icon;
    emit(AppChangeBottomSheetState());
  }
}
