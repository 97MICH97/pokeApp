import 'package:flutter/material.dart';

class PokemonProvider extends ChangeNotifier{
  List<String> _pokemonName = [];
  List<String> get pokemonName => _pokemonName;
  void setName(String newName){
    if(!_pokemonName.contains(newName)){
      _pokemonName.add(newName);
      notifyListeners();
    }

  }

  var _dataPokemon = [];
  get dataPokemon => _dataPokemon;

  void setDataPokemon(String id, String name,String image, ){
    bool exists = _dataPokemon.any((pokemon) => pokemon['id'] == id);

    if(!exists){
      _dataPokemon.add({"id": id, "name":name, "image":image});
    }
  }

  String name = '';
  Map<String, dynamic>? getPokemonById(String name) {
    return _dataPokemon.firstWhere(
          (pokemon) => pokemon["name"] == name,

    );
  }
}