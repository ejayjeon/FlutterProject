import 'package:json_annotation/json_annotation.dart';
import 'package:nosh/common/const/data.dart';
import 'package:nosh/common/utils/data_utils.dart';
import 'package:nosh/restaurant/model/restaurant_model.dart';

part 'restaurant_detail_model.g.dart';

@JsonSerializable()
/** 디테일은 이미 IModelWithId 클래스를 implements 하고있는 레스토랑모델을 Extends 하고있기 때문에 별도로 해줄필요가 없다 */
class RestaurantDetailModel extends RestaurantModel {
  final String detail;
  final List<RestaurantProductModel> products;
  RestaurantDetailModel({
    required super.id,
    required super.name,
    @JsonKey(fromJson: DataUtils.pathToUrl) required super.thumbUrl,
    required super.tags,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.deliveryTime,
    required super.deliveryFee,
    required this.detail,
    required this.products,
  });
  // factory RestaurantDetailModel.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return RestaurantDetailModel(
  //     id: json['id'],
  //     name: json['name'],
  //     thumbUrl: 'http://$ip${json['thumbUrl']}',
  //     tags: List<String>.from(json['tags']),
  //     priceRange: RestaurantPriceRange.values.firstWhere(
  //       (element) => element.name == json['priceRange'],
  //     ),
  //     ratings: json['ratings'],
  //     ratingsCount: json['ratingsCount'],
  //     deliveryTime: json['deliveryTime'],
  //     deliveryFee: json['deliveryFee'],
  //     detail: json['detail'],
  //     products: json['products']
  //         .map<RestaurantProductModel>(
  //           (x) => RestaurantProductModel.fromJson(json: x),
  //         )
  //         .toList(),
  //   );
  // }

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailModelFromJson(json);
}

@JsonSerializable()
class RestaurantProductModel {
  final String id;
  final String name;
  @JsonKey(fromJson: DataUtils.pathToUrl)
  final String imgUrl;
  final String detail;
  final int price;

  RestaurantProductModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price,
  });

  factory RestaurantProductModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantProductModelFromJson(json);

  // factory RestaurantProductModel.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return RestaurantProductModel(
  //     id: json['id'],
  //     name: json['name'],
  //     imgUrl: 'http://$ip${json['imgUrl']}',
  //     detail: json['detail'],
  //     price: json['price'],
  //   );
  // }
}
