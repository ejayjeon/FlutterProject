import 'package:jemmemo/data/data_source/memo_db_helper.dart';
import 'package:jemmemo/data/repository/memo_repository_impl.dart';
import 'package:jemmemo/domain/repository/memo_repository.dart';
import 'package:jemmemo/domain/use_case/add_memos_use_case.dart';
import 'package:jemmemo/domain/use_case/delete_memos_use_case.dart';
import 'package:jemmemo/domain/use_case/get_memo_use_case.dart';
import 'package:jemmemo/domain/use_case/get_memos_use_case.dart';
import 'package:jemmemo/domain/use_case/update_memo_use_case.dart';
import 'package:jemmemo/domain/use_case/use_cases.dart';
import 'package:jemmemo/presentation/memo/memo_view_model.dart';
import 'package:jemmemo/presentation/update_memo/update_memo_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getProviders() async {
  // db가 providers 보다 먼저 호출이 되어야함
  Database database = await openDatabase(
    'memo_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE memo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');
    },
  );

  MemoDbHelper memoDbHelper = MemoDbHelper(database);
  MemoRepository repository = MemoRepositoryImpl(memoDbHelper);
  UseCases useCases = UseCases(
    addMemosUseCase: AddMemosUseCase(repository),
    deleteMemoUseCase: DeleteMemoUseCase(repository),
    getMemoUseCase: GetMemoUseCase(repository),
    getMemosUseCase: GetMemosUseCase(repository),
    updateMemoUseCase: UpdateMemoUseCase(repository),
  );
  MemoViewModel memoViewModel = MemoViewModel(useCases);
  UpdateMemoViewModel updateMemoViewModel = UpdateMemoViewModel(repository);

  return [
    ChangeNotifierProvider(create: (_) => memoViewModel),
    ChangeNotifierProvider(create: (_) => updateMemoViewModel),
  ];
}
