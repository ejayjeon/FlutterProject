import 'package:app/common/const/ip.dart';

enum RestaurantPriceRange { expensive, medium, cheap }

class RestaurantModel {
  final String id;
  final String name;
  final String thumbUrl;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final List<String> tags;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.tags,
  });

  factory RestaurantModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      thumbUrl: 'http://$ip${json['thumbUrl']}',
      priceRange: RestaurantPriceRange.values
          .firstWhere((e) => e.name == json['priceRange']),
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
      tags: List<String>.from(json['tags']),
    );
  }
}
