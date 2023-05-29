import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../flame/battle_game.dart';

class BattlePage extends StatelessWidget {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget<BattleGame>(
      game: BattleGame(context),
      loadingBuilder: (context) => const Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
