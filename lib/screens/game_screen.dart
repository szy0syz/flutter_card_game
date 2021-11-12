import 'package:flutter/material.dart';
import 'package:flutter_card_game/components/game_board.dart';
import 'package:flutter_card_game/models/player_model.dart';
import 'package:flutter_card_game/providers/crazy_eights_game_provider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final CrazyEightGameProvider _gameProvider;

  @override
  void initState() {
    _gameProvider = Provider.of<CrazyEightGameProvider>(context, listen: false);
    super.initState();
  }

  // void tempFunc() async {
  //   final service = DeckService();
  //   final deck = await service.newDeck();
  //   print(deck.remaining);    // --> 52
  //   print("------------");
  //   final draw = await service.drawCards(deck, count: 7);
  //   print(draw.cards.length); // --> 7
  //   print("============");
  //   print(draw.remaining);    // --> 45
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
        actions: [
          TextButton(
              onPressed: () async {
                final players = [
                  PlayerModel(name: "Jerry", isHuman: true),
                  PlayerModel(name: "Bot", isHuman: false),
                ];
                await _gameProvider.newGame(players);
              },
              child: const Text(
                "New Game",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: const GameBoard(),
    );
  }
}
