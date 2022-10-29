import 'package:dio/dio.dart' hide Headers;
import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/common/model/pagination_params.dart';
import 'package:nosh/common/repository/base_pagination_repository.dart';
import 'package:nosh/product/model/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'product_repository.g.dart';

@RestApi()
abstract class ProductRepository
    implements IBasePaginationRepository<ProductModel> {
  factory ProductRepository(
    Dio dio, {
    String baseUrl,
  }) = _ProductRepository;

  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPagination<ProductModel>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}
