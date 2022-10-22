import 'package:dio/dio.dart' hide Headers;
import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/common/model/pagination_params.dart';
import 'package:nosh/common/repository/base_pagination_repository.dart';
import 'package:nosh/restaurant/model/restaurant_detail_model.dart';
import 'package:nosh/restaurant/model/restaurant_model.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

@RestApi()
// 인스턴스를 방지하기 위해 abstract
abstract class RestaurantRepository
    implements IBasePaginationRepository<RestaurantModel> {
  // http://$ip/restaurant/
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

// 페이지네이션 -> http://$ip/restaurant/
  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPagination<RestaurantModel>> paginate({
    // 어떻게 Retrofit에서 파라미터를 받나? : Queries()
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });

  // 요청 : 변수 입력 시 {id} -> http://$ip/restaurant/{id}
  @GET('/{id}')
  // Interceptor을 통해 강제로 accessToken을 넣어줌. 이 어노테이션만 달면, 앞으로 토큰을 주입시킬 수 있음
  @Headers({'accessToken': 'true'})
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path() required String id,
    // @Path('id') required String sid, -> 다를 경우
  });
}
