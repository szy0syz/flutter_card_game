import 'package:flutter/material.dart';
import 'package:flutter_card_game/components/suit_chooser_modal.dart';
import 'package:flutter_card_game/constants.dart';
import 'package:flutter_card_game/main.dart';
import 'package:flutter_card_game/models/card_model.dart';

import 'game_provider.dart';

class CrazyEightGameProvider extends GameProvider {
  @override
  Future<void> setupBoard() async {
    for (var p in players) {
      await drawCards(p, count: 3, allowanytime: true);
    }

    await drawCardToDiscardPile();

    setLastPlayed(discardTop!);

    turn.drawCount = 0;
    turn.actionCount = 0;
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
  void finishGame() {
    showToast("Game over! ${turn.currentPlayer.name} WINS!");
    notifyListeners();
  }

  @override
   bool get gameIsOver {
     if (turn.currentPlayer.cards.isEmpty) {
       return true;
     }

    return false;
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

  @override
  Future<void> applyCardSideEffect(CardModel card) async {
    // 8
    if (card.value == "8") {
      Suit suit;

      if (turn.currentPlayer.isHuman) {
        // show picker
        suit = await showDialog(
            context: navigatorKey.currentContext!,
            builder: (_) => const SuitChooserModal(),
            barrierDismissible: false);
      } else {
        suit = turn.currentPlayer.cards.first.suit;
      }

      gameState[GS_LAST_SUIT] = suit;
      setTrump(suit);
      showToast(
          "${turn.currentPlayer.name} has changede it to ${CardModel.suitToString(suit)}");
    } else if (card.value == "2") {
      await drawCards(turn.otherPlayer, count: 2, allowanytime: true);
      showToast("${turn.currentPlayer.name} has to draw 2 cards!");
    } else if (card.value == "QUEEN" && card.suit == Suit.Spades) {
      await drawCards(turn.otherPlayer, count: 5, allowanytime: true);
      showToast("${turn.currentPlayer.name} has to draw 2 cards!");
    } else if (card.value == "JACK") {
      showToast("${turn.otherPlayer.name} misses a turn!");
      skipTurn();
    }

    notifyListeners();
  }
}
