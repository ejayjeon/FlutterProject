import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/asset_controller.dart';

import 'package:whoever/app/core/ui/layout/app_layout.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/model/book_model.dart';

class BookStoryListView extends StatelessWidget {
  const BookStoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final assetController = Get.put(AssetController());
    Future getJson() async {
      final file = await rootBundle.loadString('assets/config/mock_book.json');
      final decode = jsonDecode(file);
      final book1 = BookModel.fromJson(decode['data']);
      return book1;
    }

    return AppLayout(
      body: FutureBuilder(
        future: getJson(),
        builder: (_, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return assetController.showLoading(
              onLoading: !snapshot.hasData,
            );
          }
          return Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: CustomScrollView(
                  slivers: [
                    _topPart(
                      imagePath: snapshot.data.bookImage,
                      title: snapshot.data.title,
                      description: snapshot.data.description,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: CustomScrollView(
                  slivers: [
                    // if (snapshot.data.episodes.length > 1)
                    //   for (var episode in snapshot.data.episodes) {}
                    //   ...List.generate(
                    //     snapshot.data.episodes.length,
                    //     (index) =>
                    //         // _bottomStoryList(
                    //         //   title: snapshot
                    //         //       .data.episodes[index].stories[index].title,
                    //         //   index: snapshot
                    //         //       .data.episodes[index].stories[index].index,
                    //         //   count: snapshot.data.episodes[index].stories.length,
                    //         //   isEditing: true,
                    //         // ),
                    //         _bottomEpisodeHeader(
                    //       hasEpisode: true,
                    //       title: snapshot.data.episodes[index].title,
                    //     )!,
                    //   ),
                    _bottomEpisodeHeader(hasEpisode: true, title: 'ddd')!,
                    /*
                    _bottomEpisodeHeader(hasEpisode: true, title: 'ddd')!,
                    _bottomStoryList(
                      title: snapshot.data.episodes[0].stories[0].title,
                      index: snapshot.data.episodes[0].stories[0].index,
                      count: snapshot.data.episodes[0].stories.length,
                      isEditing: true,
                    ),
                    _bottomStoryList(
                      title: snapshot.data.episodes[0].stories[1].title,
                      index: snapshot.data.episodes[0].stories[1].index,
                      count: snapshot.data.episodes[0].stories.length,
                      isEditing: true,
                    ),
                    _bottomStoryList(
                      title: snapshot.data.episodes[0].stories[2].title,
                      index: snapshot.data.episodes[0].stories[2].index,
                      count: snapshot.data.episodes[0].stories.length,
                      isEditing: true,
                    ),

                    _bottomEpisodeHeader(hasEpisode: true, title: 'ddd')!,
                    _bottomStoryList(
                      title: snapshot.data.episodes[1].stories[0].title,
                      index: snapshot.data.episodes[1].stories[0].index,
                      count: snapshot.data.episodes[1].stories.length,
                      isEditing: true,
                    ),
                    _bottomStoryList(
                      title: snapshot.data.episodes[1].stories[1].title,
                      index: snapshot.data.episodes[1].stories[1].index,
                      count: snapshot.data.episodes[1].stories.length,
                      isEditing: true,
                    ),

                    // ----------------

                    _bottomEpisodeHeader(hasEpisode: true, title: 'ddd')!,
                    _bottomStoryList(
                      title: snapshot.data.episodes[0].stories[0].title,
                      index: snapshot.data.episodes[0].stories[0].index,
                      count: snapshot.data.episodes[0].stories.length,
                      isEditing: true,
                    ),
                    _bottomStoryList(
                      title: snapshot.data.episodes[0].stories[1].title,
                      index: snapshot.data.episodes[0].stories[1].index,
                      count: snapshot.data.episodes[0].stories.length,
                      isEditing: true,
                    ),
                    _bottomStoryList(
                      title: snapshot.data.episodes[0].stories[2].title,
                      index: snapshot.data.episodes[0].stories[2].index,
                      count: snapshot.data.episodes[0].stories.length,
                      isEditing: true,
                    ),

                    _bottomEpisodeHeader(hasEpisode: true, title: 'ddd')!,
                    _bottomStoryList(
                      title: snapshot.data.episodes[1].stories[0].title,
                      index: snapshot.data.episodes[1].stories[0].index,
                      count: snapshot.data.episodes[1].stories.length,
                      isEditing: true,
                    ),
                    _bottomStoryList(
                      title: snapshot.data.episodes[1].stories[1].title,
                      index: snapshot.data.episodes[1].stories[1].index,
                      count: snapshot.data.episodes[1].stories.length,
                      isEditing: true,
                    ),

                    // ---------
                    _bottomEpisodeHeader(hasEpisode: true, title: 'ddd')!,
                    _bottomStoryList(
                      title: snapshot.data.episodes[0].stories[0].title,
                      index: snapshot.data.episodes[0].stories[0].index,
                      count: snapshot.data.episodes[0].stories.length,
                      isEditing: true,
                    ),
                    _bottomStoryList(
                      title: snapshot.data.episodes[0].stories[1].title,
                      index: snapshot.data.episodes[0].stories[1].index,
                      count: snapshot.data.episodes[0].stories.length,
                      isEditing: true,
                    ),
                    _bottomStoryList(
                      title: snapshot.data.episodes[0].stories[2].title,
                      index: snapshot.data.episodes[0].stories[2].index,
                      count: snapshot.data.episodes[0].stories.length,
                      isEditing: true,
                    ),

                    _bottomEpisodeHeader(hasEpisode: true, title: 'ddd')!,
                    _bottomStoryList(
                      title: snapshot.data.episodes[1].stories[0].title,
                      index: snapshot.data.episodes[1].stories[0].index,
                      count: snapshot.data.episodes[1].stories.length,
                      isEditing: true,
                    ),
                    _bottomStoryList(
                      title: snapshot.data.episodes[1].stories[1].title,
                      index: snapshot.data.episodes[1].stories[1].index,
                      count: snapshot.data.episodes[1].stories.length,
                      isEditing: true,
                    ), */
                  ],
                ),
              ),
              // Flexible(
              //   flex: 3,
              //   child: CustomScrollView(
              //     slivers: List.generate(
              //       snapshot.data.episodes.length,
              //       (index) => _bottomPart(
              //         count: snapshot.data.episodes[index].stories.length,
              //         hasEpisode: snapshot.data.episodes.length > 1,
              //         isEditing: true,
              //         title: snapshot.data.episodes[index].stories[index].title,
              //         episodeTitle: snapshot.data.episodes[index].title,
              //       ),
              //     ),
              //     // slivers: [
              //     //   if (snapshot.data.episodes.length > 1)
              //     //     ...List.generate(
              //     //       snapshot.data.episodes.length,
              //     //       (index) => _bottomStoryList(
              //     //         title: snapshot
              //     //             .data.episodes[index].stories[index].title,
              //     //         index: snapshot
              //     //             .data.episodes[index].stories[index].index,
              //     //         count: snapshot.data.episodes[index].stories.length,
              //     //         isEditing: true,
              //     //       ),
              //     //     ),
              //     // ],
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }

  SliverPadding _topPart({
    required String imagePath,
    required String title,
    String? description,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: SizedBox(
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: customHeader,
                      ),
                      Text(description ?? ''),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _bottomPart({
    required int count,
    required bool hasEpisode,
    required bool isEditing,
    required String title,
    String? episodeTitle,
  }) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          hasEpisode
              ? SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverFixedHeaderDelegate(
                    child: Container(
                      color: Colors.black.withOpacity(0.8),
                      child: Center(
                        child: Text(
                          episodeTitle!,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    minHeight: 30.0,
                    maxHeight: 70.0,
                  ),
                )
              : SliverPersistentHeader(
                  delegate: _SliverFixedHeaderDelegate(
                    child: Container(
                      color: Colors.black.withOpacity(0.8),
                      child: const Text(
                        'Default',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    minHeight: 30.0,
                    maxHeight: 70.0,
                  ),
                ),
          // 스토리 리스트
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     childCount: count,
          //     (_, index) {
          //       return ListTile(
          //         contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          //         minVerticalPadding: 4.0,
          //         trailing:
          //             isEditing ? Icon(Icons.edit_sharp) : Icon(Icons.check),
          //         title: Row(
          //           children: [
          //             Flexible(
          //               flex: 1,
          //               child: Text(
          //                 index.toString(),
          //               ),
          //             ),
          //             SizedBox(width: 8.w),
          //             Flexible(
          //               flex: 3,
          //               child: Text(
          //                 title,
          //                 maxLines: 1,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //             ),
          //           ],
          //         ),
          //         titleTextStyle: TextStyle(
          //           fontWeight: FontWeight.w600,
          //           fontSize: 14.sp,
          //         ),
          //         onTap: () {
          //           Log('message: ${index}');
          //         },
          //         // 길게 누를 시 정보
          //         onLongPress: () {
          //           Log('long pressed... ${index}');
          //         },
          //         dense: true,
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  SliverList _bottomStoryList({
    required String title,
    required int index,
    required bool isEditing,
    required int count,
  }) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (_, index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            minVerticalPadding: 4.0,
            trailing: isEditing ? Icon(Icons.edit_sharp) : Icon(Icons.check),
            title: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Text(
                    index.toString(),
                  ),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  flex: 3,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
            onTap: () {
              Log('message: ${index}');
            },
            // 길게 누를 시 정보
            onLongPress: () {
              Log('long pressed... ${index}');
            },
            dense: true,
          );
        },
      ),
    );
  }

  // Labeling을 할 수 있는 헤더
  SliverPersistentHeader? _bottomEpisodeHeader({
    required bool hasEpisode,
    String? title,
  }) {
    if (!hasEpisode) {
      return null;
    }
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverFixedHeaderDelegate(
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Center(
            child: Text(
              title!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        minHeight: 30.0,
        maxHeight: 70.0,
      ),
    );
  }
}

class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;

  _SliverFixedHeaderDelegate({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minExtent != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}
