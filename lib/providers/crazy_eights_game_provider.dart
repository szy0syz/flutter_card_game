import 'package:flutter_card_game/constants.dart';
import 'package:flutter_card_game/models/card_model.dart';

import 'game_provider.dart';

class CrazyEightGameProvider extends GameProvider {
  @override
  Future<void> setupBoard() async {
    for (var p in players) {
      await drawCards(p, count: 8, allowanytime: true);
    }

    await drawCardToDiscardPile();

    setLastPlayed(discardTop!);
  }

  @override
  bool get canEndTurn {
    if (turn.actionCount > 0 || turn.actionCount > 0) {
      return true;
    }

    return false;
  }

  @override
  bool canPlayCard(CardModel card) {
    bool canPlay = false;

    if (gameState[GS_LAST_SUIT] == null || gameState[GS_LAST_VALUE] == null) {
      return false;
    }

    if (gameState[GS_LAST_SUIT] == card.suit) {
      canPlay = true;
    }

    if (gameState[GS_LAST_VALUE] == card.value) {
      canPlay = true;
    }

    if (card.value == "8") {
      canPlay = true;
    }

    return canPlay;
  }

  @override
  Future<void> botTurn() async {
    final p = turn.currentPlayer;

    await Future.delayed(const Duration(milliseconds: 500));

    for (var c in p.cards) {
      if (canPlayCard(c)) {
        await playCard(player: p, card: c);
        endTurn();
        return;
      }
    }

    await Future.delayed(const Duration(milliseconds: 500));
    await drawCards(p);
    await Future.delayed(const Duration(milliseconds: 500));

    if (canPlayCard(p.cards.last)) {
      await playCard(player: p, card: p.cards.last);
    }

    endTurn();
  }
}
