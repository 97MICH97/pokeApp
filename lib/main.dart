import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/presentation/pages/home/home_page.dart';
import 'package:pokemon_app/presentation/pages/pokemonInfo/pokemon_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(initialLocation: '/Pokemon', routes: [
        GoRoute(path: '/Pokemon', builder: (context,state) => Pokemons()),
        GoRoute(path: '/PokemonInfo/:pokemonId', builder: (context,state)
        { final id = state.pathParameters["pokemonId"] ?? "";
          return PokemonInfo(pokemonId: id,);
        })
      ]),
    );
  }
}

