import 'package:flutter/material.dart';

class DrawModel {
  final int remaining;
  final List<Card> cards;

  DrawModel({required this.remaining, this.cards = const []});

  factory DrawModel.fromJson(Map<String, dynamic> json) {
    return DrawModel(remaining: json['remaining'], cards: []);
  }
}
