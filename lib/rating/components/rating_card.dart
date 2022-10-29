import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nosh/common/components/custom_sized_box.dart';
import 'package:nosh/common/const/custom_theme.dart';
import 'package:collection/collection.dart';
import 'package:nosh/rating/model/rating_model.dart';

class RatingCard extends StatelessWidget {
  final ImageProvider avatarImage;
  final List<Image> images;
  final int rating;
  final String email;
  final String content;
  const RatingCard({
    super.key,
    required this.avatarImage,
    required this.images,
    required this.rating,
    required this.email,
    required this.content,
  });

  factory RatingCard.fromModel({
    required RatingModel model,
  }) {
    return RatingCard(
      avatarImage: NetworkImage(
        model.user.imageUrl,
      ),
      images: model.imgUrls.map((e) => Image.network(e)).toList(),
      rating: model.rating,
      email: model.id,
      content: model.content,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(
          avatarImage: avatarImage,
          email: email,
          rating: rating,
        ),
        CustomSizedBox(height: 8.0),
        _Body(
          content: content,
        ),
        if (images.length > 0)
          SizedBox(
            height: 100,
            child: _Images(
              images: images,
            ),
          ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final ImageProvider avatarImage;
  final String email;
  final int rating;
  const _Header({
    super.key,
    required this.avatarImage,
    required this.email,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12.0,
          backgroundImage: avatarImage,
        ),
        CustomSizedBox(width: 8.0),
        Expanded(
          child: Text(
            email,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        // 리스트를 안에서 풀어주기 위해서
        ...List.generate(
          5,
          (index) => Icon(
            index < rating ? Icons.star : Icons.star_border_outlined,
            color: LIGHT_PRIMARY,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final String content;
  const _Body({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            content,
          ),
        ),
      ],
    );
  }
}

class _Images extends StatelessWidget {
  final List<Image> images;
  const _Images({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal, // 좌우 스크롤 -> 높이 스크롤 필요
      children: [
        ...images
            .mapIndexed(
              (index, e) => Padding(
                padding: EdgeInsets.only(
                  right: index == images.length - 1 ? 0 : 16.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: e,
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
