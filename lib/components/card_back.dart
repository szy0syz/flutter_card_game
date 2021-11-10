import 'package:flutter/material.dart';

import '../constants.dart';

class CardBack extends StatelessWidget {
  final double size;

  const CardBack({Key? key, this.size = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CARD_WIDTH * size,
      height: CARD_HEIGHT * size,
      color: Colors.grey,
    );
  }
}
