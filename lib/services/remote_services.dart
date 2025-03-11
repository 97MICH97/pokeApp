import 'package:http/http.dart' as http;
import 'package:pokemon_app/models/get_pokemon.dart';

class PokemonService{

  Future<GetPokemonModel> getPokemon(int number) async {
    final String _url = 'https://pokeapi.co/api/v2/pokemon/${number}';
    var uri = Uri.parse(_url);
    var response = await http.get(uri);

    if(response.statusCode == 200){
      return getPokemonModelFromJson(response.body);
    }else{
      throw('Ha ocurrido un error');
    }
  }
}