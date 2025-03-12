import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/presentation/pages/home/widgets/pokemon_container.dart';
import 'package:pokemon_app/provider/provider.dart';
import 'package:provider/provider.dart';
import '../../../services/remote_services.dart';
import 'delegate_search.dart';


class Pokemons extends StatefulWidget {
  const Pokemons({super.key});

  @override
  State<Pokemons> createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons> {

  int number = 15;
  var pokemon = [];
  bool isLoaing = false;
  PokemonService pokemonService = PokemonService();

  void getData() async {
    setState(() {
      isLoaing = true;
    });
    for(var i = 1; i <= number; i++ ){
      var pokemonData = await pokemonService.getPokemon(i);
      setState(() {
        pokemon.add({"id": pokemonData.id, "name": pokemonData.name, "image": pokemonData.sprites, "abilities": pokemonData.abilities, "stats": pokemonData.stats, "height": pokemonData.height, "weight": pokemonData.weight, "types" : pokemonData.types},);
      });
    }
    setState(() {
      isLoaing = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerPokemon = Provider.of<PokemonProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              Padding(padding: EdgeInsets.only(right: 10),
              child: SvgPicture.asset('assets/images/pokeball.svg'),),
              const Text('Pokédex',
                style: TextStyle(
                  color: Color(0XFFFFFFFF),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),)
            ],
          ) ,
        backgroundColor: Color(0XFFDC0A2D) ,
      ),
      backgroundColor: Color(0XFFDC0A2D),
      floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () async {
                await showSearch(context: context, delegate: SearchPokemonDelegate());
              })
      ),
      body: isLoaing ? const Center(child: CircularProgressIndicator(color: Color(0XFFFFFFFF),)) :
      Padding(padding: EdgeInsets.all(10),
          child: GridView.builder(
              itemCount: pokemon.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1
            ),
            itemBuilder: (context, index) {
                providerPokemon.setName(pokemon[index]['name'].toString());
                providerPokemon.setDataPokemon(pokemon[index]['id'].toString(), pokemon[index]['name'].toString(), pokemon[index]['image'].toString());
                return InkWell(
                  child: PokemonContainer(namePokemon: pokemon[index]['name'].toString() , numberPokemon: pokemon[index]['id'].toString(), imagePokemon: pokemon[index]['image'].toString()),
                  onTap: () => context.push('/PokemonInfo/' + pokemon[index]['id'].toString() ),
                );
            },
          )
          )
      ,
    );
  }
}
