import 'package:flutter/material.dart';
import 'package:flutter_card_game/components/card_list.dart';
import 'package:flutter_card_game/components/deck_pile.dart';
import 'package:flutter_card_game/models/player_model.dart';
import 'package:flutter_card_game/providers/game_provider.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, model, child) {
      return model.currentDeck != null
          ? Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () async {
                        await model.drawCards(model.turn.currentPlayer);
                      },
                      child: DeckPile(
                        remaining: model.currentDeck!.remaining,
                      )),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CardList(
                    player: model.players[1],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (model.turn.currentPlayer == model.players[0])
                              ElevatedButton(
                                  onPressed: model.canEndTurn
                                      ? () {
                                          model.endTurn();
                                        }
                                      : null,
                                  child: const Text("End Turn"))
                          ],
                        ),
                      ),
                      CardList(player: model.players[0]),
                    ],
                  ),
                )
              ],
            )
          : Center(
              child: TextButton(
                child: const Text("New Game?"),
                onPressed: () {
                  final players = [
                    PlayerModel(name: "Jerry", isHuman: true),
                    PlayerModel(name: "Bot", isHuman: false),
                  ];
                  model.newGame(players);
                },
              ),
            );
    });
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
