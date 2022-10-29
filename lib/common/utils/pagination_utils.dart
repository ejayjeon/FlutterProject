import 'package:flutter/cupertino.dart';
import 'package:nosh/common/provider/pagination_provider.dart';

class PaginationUtils {
  static void paginate({
    required ScrollController controller,
    required PaginationProvider provider,
  }) {
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      // 어떤 프로바이더든 Paginate 함수가 있음 -> OOP의 중요성
      // ref.read(restaurantProvider.notifier).paginate(
      //       fetchMore: true,
      //     );
      provider.paginate(
        fetchMore: true,
      );
    }
  }
}
