import 'package:dio/dio.dart' hide Headers;
import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/restaurant/model/restaurant_detail_model.dart';
import 'package:nosh/restaurant/model/restaurant_model.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

@RestApi()
// 인스턴스를 방지하기 위해 abstract
abstract class RestaurantRepository {
  // http://$ip/restaurant/
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

// 페이지네이션 -> http://$ip/restaurant/
  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPagination<RestaurantModel>> paginate();

  // 요청 : 변수 입력 시 {id} -> http://$ip/restaurant/{id}
  @GET('/{id}')
  // Interceptor을 통해 강제로 accessToken을 넣어줌. 이 어노테이션만 달면, 앞으로 토큰을 주입시킬 수 있음
  @Headers({'accessToken': 'true'})
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path() required String id,
    // @Path('id') required String sid, -> 다를 경우
  });
}

/**
 * The name 'Headers' is defined in the libraries 'package:dio/src/headers.dart (via package:dio/dio.dart)' and 'package:retrofit/http.dart (via package:retrofit/retrofit.dart)'.
Try using 'as prefix' for one of the import directives, or hiding the name from all but one of the imports.
 * 
 */
