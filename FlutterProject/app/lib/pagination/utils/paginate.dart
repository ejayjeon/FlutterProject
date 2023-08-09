import 'package:app/pagination/providers/pagination_provider.dart';
import 'package:flutter/material.dart';

class Paginate {
  static void paginate({
    required ScrollController controller,
    required PaginationProvider provider,
  }) {
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      provider.paginate(
        fetchMore: true,
      );
    }
  }
}
