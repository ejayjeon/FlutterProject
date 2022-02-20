import 'package:jemmemo/domain/model/memo.dart';

abstract class MemoRepository {
  // Memo App이 동작해야하는 기능들을 여기다가 적는다

  Future<List<Memo>> getMemos(); // DB에서 해당 메모들을 가져온다

  Future<Memo?> getMemoById(int id); // id를 제공하면 해당 메모를 가져오는 메소드

  Future<void> insertMemo(Memo memo); // 메모 추가
  Future<void> updateMemo(Memo memo); // 메모 업데이트
  Future<void> deleteMemo(Memo memo); // 메모 삭제
}
