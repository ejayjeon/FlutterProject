import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/components/custom_sized_box.dart';
import 'package:nosh/common/components/skeleton_theme.dart';
import 'package:nosh/common/layout/main_layout.dart';
import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/common/utils/pagination_utils.dart';
import 'package:nosh/product/components/product_card.dart';
import 'package:nosh/rating/components/rating_card.dart';
import 'package:nosh/rating/model/rating_model.dart';
import 'package:nosh/restaurant/components/restaurant_card.dart';
import 'package:nosh/restaurant/model/restaurant_detail_model.dart';
import 'package:nosh/restaurant/model/restaurant_model.dart';
import 'package:nosh/restaurant/provider/restaurant_provider.dart';
import 'package:nosh/restaurant/provider/restaurant_rating_provider.dart';
// import 'package:skeletons/skeletons.dart';

class RestaurantDetailScreen extends ConsumerStatefulWidget {
  const RestaurantDetailScreen({super.key, required this.id});

  final String id;
  @override
  ConsumerState<RestaurantDetailScreen> createState() =>
      _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState
    extends ConsumerState<RestaurantDetailScreen> {
  final ScrollController controller = ScrollController();
  // 누른 레스토랑의 아이디

  @override
  void initState() {
    super.initState();
    // 상세정보를 가져오는 프로바이더 실행 : restaurantDetailProvider X -> restaurantProvider를 watch하고 있기 때문에, 상태가 변경되면 알아서 빌드를 함
    ref.read(restaurantProvider.notifier).getDetail(id: widget.id);
    controller.addListener(listener);
  }

  void listener() {
    PaginationUtils.paginate(
      controller: controller,
      provider: ref.read(restaurantRatingProvider(widget.id).notifier),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(restaurantDetailProvider(widget.id));
    final ratingsState = ref.watch(restaurantRatingProvider(widget.id));

    if (state == null) {
      return MainLayout(
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return MainLayout(
      title: state.name,
      body: CustomScrollView(
        slivers: [
          renderTop(model: state),
          if (state is! RestaurantDetailModel)
            renderSkeleton(isLoading: true, count: 5),
          if (state is RestaurantDetailModel) renderLable(),
          if (state is RestaurantDetailModel)
            renderProducts(
              products: state.products,
            ),
          if (ratingsState is CursorPagination<RatingModel>)
            renderRatings(models: ratingsState.data)
        ],
      ),
    );
  }

  SliverPadding renderSkeleton({
    required isLoading,
    required count,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          List.generate(
            5,
            (index) => SkeletonTheme(),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter renderTop({
    required RestaurantModel model,
  }) {
    return SliverToBoxAdapter(
      child: RestaurantCard.fromModel(
        model: model,
        isDetail: true,
      ),
    );
  }

  SliverPadding renderProducts(
      {required List<RestaurantProductModel> products}) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final model = products[index];
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProductCard.fromRestaurantProductModel(
                model: model,
              ),
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }

  SliverPadding renderLable() {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'MENU',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  SliverPadding renderRatings({
    required List<RatingModel> models,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RatingCard.fromModel(
              model: models[index],
            ),
          ),
          childCount: models.length,
        ),
      ),
    );
  }
}
