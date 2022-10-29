import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/components/custom_sized_box.dart';
import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/common/model/model_with_id.dart';
import 'package:nosh/common/provider/pagination_provider.dart';
import 'package:nosh/common/utils/pagination_utils.dart';

typedef PaginationWidgetBuilder<T extends IModelWithId> = Widget Function(
    BuildContext context, int index, T model);
// 직접 정의한 typedef, T Model은 IModelWithId를 직접 extends 한 모델만 받을 수 있음

class PaginationListView<T extends IModelWithId>
    extends ConsumerStatefulWidget {
  final PaginationWidgetBuilder<T> itemBuilder;
  final StateNotifierProvider<PaginationProvider, CursorPaginationBase>
      provider;
  const PaginationListView({
    super.key,
    required this.provider,
    required this.itemBuilder,
  });

  @override
  ConsumerState<PaginationListView> createState() =>
      _PaginationListViewState<T>();
}

class _PaginationListViewState<T extends IModelWithId>
    extends ConsumerState<PaginationListView> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  void listener() {
    PaginationUtils.paginate(
      controller: controller,
      provider: ref.read(widget.provider.notifier), // 외부 프로바이더
    );
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.provider); // 프로바이더를 바라봄
    /** 프로바이더의 값이 Loading인 경우, 로딩바 */
    if (state is CursorPaginationLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    /** 프로바이더의 값이 Error인 경우, 에러 데이터 */
    if (state is CursorPaginationError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            state.message,
            textAlign: TextAlign.center,
          ),
          CustomSizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              ref.read(widget.provider.notifier).paginate(
                    forceRefetch: true,
                  );
            },
            child: Text('새로고침'),
          ),
        ],
      );
    }

    /** 로딩, 에러를 제외하고, CursorPaginationBase를 상속받은 경우  */
    final cp = state as CursorPagination<T>;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        controller: controller,
        // FutureBuild : 추가로 데이터를 요청하기 위해 사용, 프로바이더를 사용해서, async 로직을 완료한 경우 굳이 FutureBuilder를 쓸 필요가 없게됨
        itemCount: cp.data.length + 1,
        itemBuilder: (_, index) {
          if (index == cp.data.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Center(
                child: cp is CursorPaginationFetchingMore
                    ? CircularProgressIndicator()
                    : Text('마지막 데이터입니다'),
              ),
            );
          }
          final pItem = cp.data[index];
          // Factory Contructor을 만들면 아래에서 해주었던 패턴을 할 필요가 없게 된다
          // final pItem = RestaurantModel.fromJson(item);
          // final pItem = RestaurantModel(
          //   id: item['id'],
          //   name: item['name'],
          //   thumbUrl: 'http://${ip}${item['thumbUrl']}',
          //   tags: List<String>.from(item['tags']),
          //   priceRange: RestaurantPriceRange.values.firstWhere(
          //       (element) => element.name == item['priceRange']),
          //   ratings: item['ratings'],
          //   ratingsCount: item['ratingsCount'],
          //   deliveryTime: item['deliveryTime'],
          //   deliveryFee: item['deliveryFee'],
          // );

          // Factory Model
          return widget.itemBuilder(context, index, pItem);
        },
        separatorBuilder: (_, index) {
          return CustomSizedBox(height: 16.0);
        },
      ),
    );
  }
}
