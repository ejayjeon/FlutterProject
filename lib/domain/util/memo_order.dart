import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jemmemo/domain/util/order_type.dart';

part 'memo_order.freezed.dart';

@freezed
abstract class MemoOrder with _$MemoOrder {
  const factory MemoOrder.title(OrderType orderType) = MemoOrderTitle;
  const factory MemoOrder.date(OrderType orderType) = MemoOrderDate;
  const factory MemoOrder.color(OrderType orderType) = MemoOrderColor;
}
