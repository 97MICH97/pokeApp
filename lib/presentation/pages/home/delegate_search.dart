

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/presentation/pages/home/widgets/pokemon_container.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';

class SearchPokemonDelegate extends SearchDelegate<String>{

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final providerPokemon = Provider.of<PokemonProvider>(context);
    final List<String> searchResults = providerPokemon.pokemonName
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
      return Padding(padding: EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: searchResults.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1
        ),
        itemBuilder: (context, index) {
          if(providerPokemon.pokemonName.contains(searchResults[index])){
            var findPokemon = providerPokemon.getPokemonById(searchResults[index]);
              return InkWell(
              child: PokemonContainer(namePokemon: findPokemon?['name'], numberPokemon: findPokemon?['id'], imagePokemon: findPokemon?['image']),
              onTap: () => context.pushReplacement('/PokemonInfo/'+ findPokemon?['id']),
            );
          };
        },
      )
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final providerPokemon = Provider.of<PokemonProvider>(context);
    final List<String> suggestionList = query.isEmpty
        ? []
        : providerPokemon.pokemonName
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            // Show the search results based on the selected suggestion.
          },
        );
      },
    );
  }
}