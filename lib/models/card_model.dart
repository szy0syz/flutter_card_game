// ignore_for_file: constant_identifier_names

enum Suit {
  Hearts,
  Clubs,
  Diamonds,
  Spades,
  Other,
}

class CardModel {
  final String image;
  final String suit;
  final String value;

  CardModel(this.image, this.suit, this.value);
}
