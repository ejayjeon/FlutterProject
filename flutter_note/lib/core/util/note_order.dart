import 'package:flutter_note/core/util/order_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_order.freezed.dart';

@freezed
abstract class NoteOrder with _$NoteOrder {
  const factory NoteOrder.title(OrderType orderType) = NoteOrderByTitle;
  const factory NoteOrder.time(OrderType orderType) = NoteOrderByTime;
  const factory NoteOrder.color(OrderType orderType) = NoteOrderByColor;
}
