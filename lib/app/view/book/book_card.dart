import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    final _cardKey = GlobalKey<FlipCardState>();
    FlipCardController controller = FlipCardController();
    return SafeArea(
      child: Scaffold(
        body: FlipCard(
          controller: controller,
          key: _cardKey,
          fill: Fill.fillBack,
          direction: FlipDirection.HORIZONTAL, // default
          side: CardSide.FRONT,
          autoFlipDuration: const Duration(seconds: 2),
          speed: 1000,
          front: Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () => _cardKey.currentState!.toggleCard(),
              child: Text('Toggle'),
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
        ),
      ),
    );
  }
}
