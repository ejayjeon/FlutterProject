import 'package:flutter/material.dart';
import 'package:jemmemo/domain/util/memo_order.dart';
import 'package:jemmemo/domain/util/order_type.dart';

class OrderSection extends StatelessWidget {
  final MemoOrder memoOrder;
  final Function(MemoOrder memoOrder) onOrderChanged;
  const OrderSection(
      {Key? key, required this.memoOrder, required this.onOrderChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<MemoOrder>(
              value: MemoOrder.title(memoOrder.orderType),
              groupValue: memoOrder,
              onChanged: (MemoOrder? value) {
                onOrderChanged(MemoOrder.title(memoOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text(
              '제목',
              style: TextStyle(color: Colors.white),
            ),
            Radio<MemoOrder>(
              value: MemoOrder.date(memoOrder.orderType),
              groupValue: memoOrder,
              onChanged: (MemoOrder? value) {
                onOrderChanged(MemoOrder.date(memoOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text('날짜', style: TextStyle(color: Colors.white)),
            Radio<MemoOrder>(
              value: MemoOrder.color(memoOrder.orderType),
              groupValue: memoOrder,
              onChanged: (MemoOrder? value) {
                onOrderChanged(MemoOrder.color(memoOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text('색상', style: TextStyle(color: Colors.white)),
            Radio<OrderType>(
              value: OrderType.ascending(),
              groupValue: memoOrder.orderType,
              onChanged: (OrderType? value) {
                onOrderChanged(
                    memoOrder.copyWith(orderType: const OrderType.ascending()));
              },
              activeColor: Colors.white,
            ),
            const Icon(Icons.upload_sharp, color: Colors.white),
            Radio<OrderType>(
              value: OrderType.descending(),
              groupValue: memoOrder.orderType,
              onChanged: (OrderType? value) {
                onOrderChanged(memoOrder.copyWith(
                    orderType: const OrderType.descending()));
              },
              activeColor: Colors.white,
            ),
            const Icon(
              Icons.download_sharp,
              color: Colors.white,
            ),
          ],
        ),
        // Row(
        //   children: [

        //   ],
        // ),
      ],
    );
  }
}
