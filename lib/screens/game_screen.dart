import 'package:flutter/material.dart';
import 'package:flutter_card_game/components/game_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
        actions: [
          TextButton(
              onPressed: () {},
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
