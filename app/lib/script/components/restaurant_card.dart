import 'package:app/common/const/ip.dart';
import 'package:app/script/model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<String> tags;
  final String priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  const RestaurantCard({
    super.key,
    required this.image,
    required this.name,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  factory RestaurantCard.fromModel({
    required RestaurantModel model,
  }) {
    return RestaurantCard(
      image: Image.network(model.thumbUrl),
      name: model.name,
      tags: model.tags,
      priceRange: model.priceRange.toString(),
      ratings: model.ratings,
      ratingsCount: model.ratingsCount,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 테두리 원으로 정리
        ClipRRect(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          child: image,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              tags.join(' · '),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
            renderDot(),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          children: [
            _IconData(
              icon: Icons.star,
              label: ratings.toString(),
            ),
            renderDot(),
            _IconData(
              icon: Icons.people,
              label: ratingsCount.toString(),
            ),
            renderDot(),
            _IconData(
              icon: Icons.timelapse_outlined,
              label: '$deliveryTime 분',
            ),
            renderDot(),
            _IconData(
                icon: Icons.monetization_on,
                label: deliveryFee == 0 ? '무료' : '$deliveryFee 원'),
          ],
        ),
      ],
    );
  }

  renderDot() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: Text(
        ' · ',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 10.0,
        ),
      ),
    );
  }
}

class _IconData extends StatelessWidget {
  final IconData icon;
  final String label;
  const _IconData({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14.0,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(
          width: 4.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
