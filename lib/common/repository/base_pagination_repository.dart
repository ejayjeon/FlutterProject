import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/common/model/pagination_params.dart';
import 'package:retrofit/retrofit.dart';

abstract class IBasePaginationRepository<T> {
  Future<CursorPagination<T>> paginate({
    // 어떻게 Retrofit에서 파라미터를 받나? : Queries()
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}
