
import 'package:flutter_card_game/models/card_model.dart';

import 'game_provider.dart';

class CrazyEightGameProvider extends GameProvider {

  @override
  Future<void> setupBoard() async {
    for (var p in players) {
      await drawCards(p, count: 8, allowanytime: true);
    }

    drawCardToDiscardPile();
  }

  @override
  bool canPlayCard(CardModel card) {
    return true;
  }
}