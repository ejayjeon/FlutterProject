import 'package:flutter/material.dart';
import 'package:nosh/common/components/custom_sized_box.dart';
import 'package:nosh/common/const/color_schemes.g.dart';
import 'package:nosh/product/components/product_card.dart';
import 'package:nosh/restaurant/model/restaurant_detail_model.dart';
import 'package:nosh/restaurant/model/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.image,
    required this.name,
    required this.tags,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
    this.isDetail = false,
    this.detail,
  });

  final Widget image; // 이미지
  final String name; // 레스토랑 이름
  final List<String> tags; // 레스토랑 태그
  final double ratings; // 평점
  final int ratingsCount; // 평점 갯수
  final int deliveryTime; // 배달 시간
  final int deliveryFee; // 배달 비용
  final bool isDetail; // 상세페이지 카드인지 구분하기 위함
  final String? detail;

  factory RestaurantCard.fromModel({
    required RestaurantModel model,
    bool isDetail = false,
    String detail = '',
  }) {
    return RestaurantCard(
      image: Image.network(
        model.thumbUrl,
        fit: BoxFit.cover,
      ),
      name: model.name,
      // List<dynamic> type을 List<String> type으로 변경
      tags: model.tags,
      ratings: model.ratings,
      ratingsCount: model.ratingsCount,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
      isDetail: isDetail,
      detail: model is RestaurantDetailModel ? model.detail : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isDetail) image,
        if (!isDetail)
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: image,
          ),
        CustomSizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDetail ? 16.0 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CustomSizedBox(height: 8.0),
              Text(
                tags.join('#'),
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500],
                ),
              ),
              CustomSizedBox(height: 8.0),
              Row(
                children: [
                  _IconText(
                    icon: Icons.star_border_outlined,
                    lable: ratings.toString(),
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.receipt_outlined,
                    lable: ratingsCount.toString(),
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.timelapse_outlined,
                    lable: '$deliveryTime 분',
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.delivery_dining_outlined,
                    lable: deliveryFee == 0 ? '무료' : deliveryFee.toString(),
                  ),
                ],
              ),
              if (detail != null && isDetail)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    detail!,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  renderDot() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        ' ・ ',
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  _IconText({
    super.key,
    required this.icon,
    required this.lable,
  });

  var light = (ThemeMode.light == true);
  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: light ? lightColorScheme.primary : darkColorScheme.primary,
          size: 14.0,
        ),
        CustomSizedBox(width: 4.0),
        Text(
          lable,
          style: const TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
