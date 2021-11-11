# flutter_card_game

> 从来没想过写个项目能那么 “自由” ! 从另一方面说是技术底层十分 “厚重”。

## Notes

- `card_model.dart`

```dart
enum Suit {
  Hearts,
  Clubs,
  Diamonds,
  Spades,
  Other,
}

class CardModel {
  final String image;
  final Suit suit;
  final String value;

  CardModel({
    required this.image,
    required this.suit,
    required this.value,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      image: json['image'],
      suit: stringToSuit(json['suit']),
      value: json['value'],
    );
  }

  static Suit stringToSuit(String suit) {
    switch (suit.toUpperCase().trim()) {
      case "HEARTS":
        return Suit.Hearts;
      case "CLUBS":
        return Suit.Clubs;
      case "DIAMONDS":
        return Suit.Diamonds;
      case "SPADES":
        return Suit.Spades;
      default:
        return Suit.Other;
    }
  }

  static String suitToString(Suit suit) {
    switch (suit) {
      case Suit.Hearts:
        return "Hearts";
      case Suit.Clubs:
        return "Clubs";
      case Suit.Diamonds:
        return "Diamonds";
      case Suit.Spades:
        return "Spades";
      case Suit.Other:
        return "Other";
    }
  }

  static String suitToUnicode(Suit suit) {
    switch (suit) {
      case Suit.Hearts:
        return "\u2665";
      case Suit.Clubs:
        return "\u2663";
      case Suit.Diamonds:
        return "\u2666";
      case Suit.Spades:
        return "\u2660";
      case Suit.Other:
        return "Other";
    }
  }

  static Color suitToColor(Suit suit) {
    switch (suit) {
      case Suit.Hearts:
      case Suit.Diamonds:
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
```

- `draw_model.dart`

```dart
class DrawModel {
  final int remaining;
  final List<Card> cards;

  DrawModel({required this.remaining, this.cards = const []});

  factory DrawModel.fromJson(Map<String, dynamic> json) {
    final cards =
        json["cards"].map<CardModel>((card) => CardModel.fromJson(card)).toList();

    return DrawModel(remaining: json['remaining'], cards: cards);
  }
}
```

> **以上两段代码真的十分“面向对象”，也是一种面向对象的思想。**
>
> 写太多了前端，还是很缺这样的思想的。

### use my “Provider”

```dart
void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => GameProvider())],
    child: const MyApp(),
  ));
}
```

```dart
class _GameScreenState extends State<GameScreen> {
  late final GameProvider _gameProvider;

  @override
  void initState() {
    _gameProvider = Provider.of<GameProvider>(context, listen: false);
    super.initState();
  }
}
```
