import 'package:flutter/material.dart';
import 'package:flutter_card_game/components/card_back.dart';

class DeckPile extends StatelessWidget {
  final int remaining;
  final double size;
  final bool canDraw;

  const DeckPile({
    Key? key,
    required this.remaining,
    this.size = 1,
    this.canDraw = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardBack(
      size: 1,
      child: Center(
        child: Text(
          remaining.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
