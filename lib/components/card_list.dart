import 'package:flutter/material.dart';
import 'package:flutter_card_game/components/playing_card.dart';
import 'package:flutter_card_game/constants.dart';
import 'package:flutter_card_game/models/card_model.dart';
import 'package:flutter_card_game/models/player_model.dart';

class CardList extends StatelessWidget {
  final double size;
  final PlayerModel player;
  final Function(CardModel)? onPlayCard;

  const CardList(
      {Key? key, required this.player, this.size = 1, this.onPlayCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CARD_HEIGHT * size,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: player.cards.length,
        itemBuilder: (context, index) {
          final card = player.cards[index];
          return PlayingCard(
            card: card,
            size: size,
            visible: true,
          );
        }
        ),
    );
  }
}
