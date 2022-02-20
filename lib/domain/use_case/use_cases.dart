import 'package:jemmemo/domain/use_case/add_memos_use_case.dart';
import 'package:jemmemo/domain/use_case/delete_memos_use_case.dart';
import 'package:jemmemo/domain/use_case/get_memo_use_case.dart';
import 'package:jemmemo/domain/use_case/get_memos_use_case.dart';
import 'package:jemmemo/domain/use_case/update_memo_use_case.dart';

class UseCases {
  final AddMemosUseCase addMemosUseCase;
  final DeleteMemoUseCase deleteMemoUseCase;
  final GetMemoUseCase getMemoUseCase;
  final GetMemosUseCase getMemosUseCase;
  final UpdateMemoUseCase updateMemoUseCase;

  UseCases(
      {required this.addMemosUseCase,
      required this.deleteMemoUseCase,
      required this.getMemoUseCase,
      required this.getMemosUseCase,
      required this.updateMemoUseCase});
}
