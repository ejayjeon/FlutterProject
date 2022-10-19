import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:nosh/common/components/custom_sized_box.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonTheme extends StatelessWidget {
  const SkeletonTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
        CustomSizedBox(width: 8.0),
        Expanded(
          child: SkeletonParagraph(
            style: SkeletonParagraphStyle(
              lines: 5,
              spacing: 5,
              lineStyle: SkeletonLineStyle(
                randomLength: true,
                height: 10,
                borderRadius: BorderRadius.circular(8),
                minLength: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
