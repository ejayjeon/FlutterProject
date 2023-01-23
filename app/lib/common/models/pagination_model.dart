// Inteface
import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

abstract class PaginationBase {}

// 1. Error 상황
class PaginationError extends PaginationBase {
  final String message;

  PaginationError({
    required this.message,
  });
}

// 2. Loading 상황
class PaginationLoading extends PaginationBase {}

// 3. Pagination 상황
@JsonSerializable(
  genericArgumentFactories: true,
)
class Pagination<T> extends PaginationBase {
  final PaginationMeta meta;
  final List<T> data;

  Pagination({
    required this.meta,
    required this.data,
  });

  Pagination copyWith({
    PaginationMeta? meta,
    List<T>? data,
  }) {
    return Pagination<T>(
      meta: meta ?? this.meta,
      data: data ?? this.data,
    );
  }

  factory Pagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginationFromJson(json, fromJsonT);
}

@JsonSerializable()
class PaginationMeta {
  final int count;
  final bool hasMore;

  PaginationMeta({
    required this.count,
    required this.hasMore,
  });

  PaginationMeta copyWith({
    int? count,
    bool? hasMore,
  }) {
    return PaginationMeta(
      count: count ?? this.count,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

// 4. 새로고침
class PaginationRefetching<T> extends Pagination<T> {
  PaginationRefetching({
    required super.meta,
    required super.data,
  });
}

// 5. 리스트 추가요청
class PaginationFetchingMore<T> extends Pagination<T> {
  PaginationFetchingMore({
    required super.meta,
    required super.data,
  });
}

abstract class ModelWithId {
  final String id;

  ModelWithId({
    required this.id,
  });
}
