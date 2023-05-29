import 'package:flutter/material.dart';
import 'package:last_rpg_client/pages/battle_page.dart';

import 'app_routes.dart';

class AppRouteGenerator {
  AppRouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingRoute:
        return MaterialPageRoute(
          builder: (_) => const BattlePage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('Nenhuma rota encontrada para ${settings.name}'),
              ),
            ),
          ),
        );
    }
  }
}
