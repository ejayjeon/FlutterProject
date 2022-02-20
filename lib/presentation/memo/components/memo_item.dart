import 'package:flutter/material.dart';
import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/ui/colors.dart';

class MemoItem extends StatelessWidget {
  final Memo memo;
  final Function? onDeleteTap;
  const MemoItem({Key? key, required this.memo, this.onDeleteTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(memo.color),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  memo.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .apply(color: darkGray),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  memo.content,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .apply(color: darkGray),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                // Text(memo.timestamp.toString()),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                onDeleteTap?.call();
              },
              child: const Icon(
                Icons.delete,
              ),
            ),
          )
        ],
      ),
    );
  }
}
