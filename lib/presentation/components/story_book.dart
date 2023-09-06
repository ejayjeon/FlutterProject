import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whoever/common/theme/custom_theme.dart';

class StoryBook extends ConsumerWidget {
  const StoryBook({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 150,
        height: 200,
        color: Colors.blue,
        child: Column(
          children: [
            Stack(
              children: [
                Text(
                  '책',
                  style: HEADER_TEXT,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
