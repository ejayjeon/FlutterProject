import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/common/model/model_with_id.dart';
import 'package:nosh/common/model/pagination_params.dart';
import 'package:retrofit/retrofit.dart';

abstract class IBasePaginationRepository<T extends IModelWithId> {
  Future<CursorPagination<T>> paginate({
    // 어떻게 Retrofit에서 파라미터를 받나? : Queries()
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}
