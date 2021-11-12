import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_game/components/card_back.dart';
import 'package:flutter_card_game/constants.dart';
import 'package:flutter_card_game/models/card_model.dart';

class PlayingCard extends StatelessWidget {
  final CardModel card;
  final double size;
  final bool visible;
  final Function(CardModel)? onPlayCard;

  const PlayingCard(
      {Key? key,
      required this.card,
      this.size = 1,
      this.visible = false,
      this.onPlayCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPlayCard !=null) onPlayCard!(card);
      },
      child: Container(
        width: CARD_WIDTH * size,
        height: CARD_HEIGHT * size,
        child: visible
            ? CachedNetworkImage(
                imageUrl: card.image,
                width: CARD_WIDTH * size,
                height: CARD_HEIGHT * size,
              )
            : CardBack(
                size: size,
              ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}
