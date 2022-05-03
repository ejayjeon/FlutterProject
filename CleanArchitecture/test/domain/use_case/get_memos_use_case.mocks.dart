// Mocks generated by Mockito 5.1.0 from annotations
// in jemmemo/test/domain/use_case/get_memos_use_case.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:jemmemo/domain/model/memo.dart' as _i4;
import 'package:jemmemo/domain/repository/memo_repository.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [MemoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMemoRepository extends _i1.Mock implements _i2.MemoRepository {
  MockMemoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Memo>> getMemos() =>
      (super.noSuchMethod(Invocation.method(#getMemos, []),
              returnValue: Future<List<_i4.Memo>>.value(<_i4.Memo>[]))
          as _i3.Future<List<_i4.Memo>>);
  @override
  _i3.Future<_i4.Memo?> getMemoById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMemoById, [id]),
          returnValue: Future<_i4.Memo?>.value()) as _i3.Future<_i4.Memo?>);
  @override
  _i3.Future<void> insertMemo(_i4.Memo? memo) =>
      (super.noSuchMethod(Invocation.method(#insertMemo, [memo]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> updateMemo(_i4.Memo? memo) =>
      (super.noSuchMethod(Invocation.method(#updateMemo, [memo]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> deleteMemo(_i4.Memo? memo) =>
      (super.noSuchMethod(Invocation.method(#deleteMemo, [memo]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}