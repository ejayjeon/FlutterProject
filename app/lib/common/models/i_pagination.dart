import 'package:app/common/models/pagination_model.dart';
import 'package:app/common/models/pagination_params.dart';

abstract class IPagination<T extends ModelWithId> {
  Future<Pagination<T>> pagination({
    PaginationParams? paginationParams,
  });
}
