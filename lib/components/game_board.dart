import 'package:flutter/material.dart';
import 'package:flutter_card_game/components/playing_card.dart';
import 'package:flutter_card_game/models/card_model.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // @override
  // Widget build(BuildContext context) {
  //   final card = CardModel(
  //       image: "https://deckofcardsapi.com/static/img/KH.png",
  //       suit: Suit.Hearts,
  //       value: "KING");
  //   return Center(
  //     child: PlayingCard(
  //       card: card,
  //       visible: true,
  //     ),
  //   );
  // }
}
