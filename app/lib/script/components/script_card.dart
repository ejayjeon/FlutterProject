import 'package:flutter/material.dart';

/** 
 * 메인에 보이는 Book 형태의 Script Card 수
*/
class ScriptCard extends StatelessWidget {
  final Widget image; // 이미지
  final String title; // 제목
  final String description; // 소개
  final List<String> tags; // 관련 태그들
  final bool isShared; // false: Private, true: public
  final int sharerCount; // 공유자 수 : 기본 1
  final int favCount; // 좋아요 수
  const ScriptCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.tags,
    this.isShared = false,
    this.sharerCount = 1,
    this.favCount = 0,
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
              color: Theme.of(context).primaryColor,
            ),
            Text(
              sharerCount.toString(),
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13.0,
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
              label: sharerCount.toString(),
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
          color: Theme.of(context).primaryColor,
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
