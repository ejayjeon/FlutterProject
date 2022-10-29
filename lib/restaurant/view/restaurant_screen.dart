import 'package:flutter/material.dart';
import 'package:nosh/common/components/pagination_list_view.dart';
import 'package:nosh/restaurant/components/restaurant_card.dart';
import 'package:nosh/restaurant/provider/restaurant_provider.dart';
import 'package:nosh/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  // 어디까지 스크롤을 했는지 알기 위해

  @override
  Widget build(BuildContext context) {
    return PaginationListView(
      provider: restaurantProvider,
      itemBuilder: <RestaurantModel>(_, index, model) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RestaurantDetailScreen(
                  id: model.id,
                ),
              ),
            );
          },
          child: RestaurantCard.fromModel(
            model: model,
          ),
        );
      },
    );
  }
}
