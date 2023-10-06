import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/util/utils.dart';

class BookCard extends StatelessWidget {
  final String? imagePath;
  final double width;

  const BookCard({
    super.key,
    this.imagePath,
    this.width = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    final _cardKey = GlobalKey<FlipCardState>();
    FlipCardController controller = FlipCardController();
    return FlipCard(
      controller: controller,
      key: _cardKey,
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.FRONT,
      autoFlipDuration: const Duration(seconds: 2),
      speed: 1000,
      front: GestureDetector(
        onTap: () => _cardKey.currentState!.toggleCard(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath!,
            fit: BoxFit.cover,
            width: width,
            height: width * 1.5,
          ),
        ),
      ),
      back: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 64, 255, 220),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 300,
        width: 200,
        child: TextButton(
          onPressed: () => _cardKey.currentState!.toggleCard(),
          child: Text('Toggle'),
        ),
      ),
    );
  }
}
