import 'package:flutter/material.dart';
import 'package:flutter_card_game/providers/crazy_eights_game_provider.dart';
import 'package:flutter_card_game/screens/game_screen.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final rootScaffoldMessemgerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CrazyEightGameProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Card Game',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: rootScaffoldMessemgerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameScreen(),
    );
  }
}
