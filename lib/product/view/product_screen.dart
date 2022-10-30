import 'package:flutter/material.dart';
import 'package:nosh/common/components/pagination_list_view.dart';
import 'package:nosh/product/components/product_card.dart';
import 'package:nosh/product/model/product_model.dart';
import 'package:nosh/product/provider/product_provider.dart';
import 'package:nosh/restaurant/view/restaurant_detail_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginationListView<ProductModel>(
        provider: productProvider,
        itemBuilder: <ProductModel>(_, index, model) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RestaurantDetailScreen(
                    id: model.restaurant.id,
                  ),
                ),
              );
            },
            child: ProductCard.fromProductModel(model: model),
          );
        });
  }
}
