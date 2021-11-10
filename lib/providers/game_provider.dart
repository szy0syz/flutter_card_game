import 'package:flutter/material.dart';
import 'package:flutter_card_game/models/card_model.dart';
import 'package:flutter_card_game/models/deck_model.dart';
import 'package:flutter_card_game/models/player_model.dart';
import 'package:flutter_card_game/services/deck_service.dart';

class GameProvider with ChangeNotifier {
  GameProvider() {
    _service = DeckService();
  }

  late DeckService _service;

  // 这样写只读属性
  DeckModel? _currentDeck;
  DeckModel? get currentDeck => _currentDeck;

  final List<PlayerModel> _players = [];
  List<PlayerModel> get players => _players;

  final List<CardModel> _discards = [];
  List<CardModel> get discards => _discards;

  CardModel? get discardTop => _discards.isEmpty ? null : _discards.last;

  Map<String, dynamic> gameState = {};
}
