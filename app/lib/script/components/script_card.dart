import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScriptCard extends StatelessWidget {
  final Widget image;
  final String title;
  final List<String> tags;
  final bool isShared;
  final Color iconColor;
  final int? sharerCount; // 공유자 수 : 기본 1
  const ScriptCard({
    super.key,
    required this.image,
    required this.title,
    required this.tags,
    this.isShared = false,
    this.sharerCount = 1,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              child: image,
            ),
            Icon(
              Icons.person,
              color: iconColor,
            ),
            Text(
              sharerCount.toString(),
              style: TextStyle(
                fontSize: 14.0,
                color: iconColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Column(
          children: [
            Text(title),
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
              iconColor: iconColor,
              label: '별점',
            ),
            renderDot(),
            _IconData(
              iconColor: iconColor,
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
  final Color iconColor;
  const _IconData({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
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
