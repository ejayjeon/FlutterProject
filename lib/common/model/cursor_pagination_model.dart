import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination_model.g.dart';

// 페이지네이션 데이터가 들어왔는지 여부를 확인하기 위해서, 상속을 이용한다.
// CursorPatinationBase 타입이 나오는지 확인하기 위해서 OOP의 특성
abstract class CursorPaginationBase {}

// 에러가 났을 때
class CursorPaginationError extends CursorPaginationBase {
  final String message;

  CursorPaginationError({
    required this.message,
  });
}

// 로딩 상태
class CursorPaginationLoading extends CursorPaginationBase {}

// 데이터가 성공적으로 들어왔을 때
@JsonSerializable(genericArgumentFactories: true)
class CursorPagination<T> extends CursorPaginationBase {
  final CursorPaginationMeta meta;
  final List<T> data;

  CursorPagination({
    required this.meta,
    required this.data,
  });

  factory CursorPagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CursorPaginationFromJson(json, fromJsonT);
}

@JsonSerializable()
class CursorPaginationMeta {
  final int count;
  final bool hasMore;

  CursorPaginationMeta({
    required this.count,
    required this.hasMore,
  });

  factory CursorPaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$CursorPaginationMetaFromJson(json);
}

// 새로고침 : Meta, Data가 이미 존재하고 있다는 상태 안에

// CursorPagination의 자식이자 CursorPaginationBase의 자식
class CursorPaginationRefetching<T> extends CursorPagination<T> {
  CursorPaginationRefetching({
    required super.meta,
    required super.data,
  });
}

// 페이지 맨 밑에서 불러오기를 할 때
class CursorPaginationFetchingMore<T> extends CursorPagination<T> {
  CursorPaginationFetchingMore({
    required super.meta,
    required super.data,
  });
}
