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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          child: image,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Column(
          children: [
            Text(name),
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
              label: '별점',
            ),
            renderDot(),
            _IconData(
              icon: Icons.favorite,
              label: '좋아요',
            ),
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
