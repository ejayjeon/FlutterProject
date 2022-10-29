import 'package:json_annotation/json_annotation.dart';
import 'package:nosh/common/const/data.dart';
import 'package:nosh/common/model/model_with_id.dart';
import 'package:nosh/common/utils/data_utils.dart';

part 'restaurant_model.g.dart';

enum RestaurantPriceRange { expensive, medium, cheap }

@JsonSerializable()
class RestaurantModel implements IModelWithId {
  final String
      id; // id를 정의했기 때문에 에러가 나지 않음. 만약 implement를 했음에도 id가 정의되지 않았으면 당연히 에러가 발생한다
  final String name;
  @JsonKey(
    fromJson: DataUtils.pathToUrl,
  )
  final String thumbUrl;
  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
  });

// Json 에서 만들 Factory 파일을 불러오는 과정
  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);

// 무조건 static이어야 한다.
// flutter pub run build_runnder build / watch
}

// Json 값을 가져옴
//   factory RestaurantModel.fromJson({
//     required Map<String, dynamic> json,
//   }) {
//     return RestaurantModel(
//       id: json['id'],
//       name: json['name'],
//       thumbUrl: 'http://$ip${json['thumbUrl']}',
//       tags: List<String>.from(json['tags']),
//       priceRange: RestaurantPriceRange.values.firstWhere(
//         (element) => element.name == json['priceRange'],
//       ),
//       ratings: json['ratings'],
//       ratingsCount: json['ratingsCount'],
//       deliveryTime: json['deliveryTime'],
//       deliveryFee: json['deliveryFee'],
//     );
//   }
// }

/**  FACTORY CONTRRUCTOR를 만드는 이유
 * 외부에서 받아온 값들을 메소드로 받아서 FACTORY CONSTRUCTOR 내부에서 가공할 수 있음. 
 * 즉, Model Class를 사용하는 부분에서는 단순히 제공받은 데이터를 따로 가공할 필요가 없게 됨
*/
