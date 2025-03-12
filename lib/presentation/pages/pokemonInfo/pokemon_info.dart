import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/presentation/pages/loadingPage/loadingPage.dart';
import '../../../services/remote_services.dart';
import 'container_info_pokemon.dart';

class PokemonInfo extends StatefulWidget {
  String pokemonId = '';
  PokemonInfo({super.key,  required this.pokemonId});

  @override
  State<PokemonInfo> createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  bool isLoaing = false;
  PokemonService pokemonService = PokemonService();
  var pokemon = [];


  void getPokemonDetail() async{
    setState(() {
      isLoaing = true;
    });
    var pokemonData = await pokemonService.getPokemon(int.parse(widget.pokemonId));
    setState(() {
      pokemon.add({"id": pokemonData.id, "name": pokemonData.name, "image": pokemonData.sprites, "abilities": pokemonData.abilities, "stats": pokemonData.stats, "height": pokemonData.height, "weight": pokemonData.weight, "types" : pokemonData.types});
    });
    setState(() {
      isLoaing = false;
    });
  }

  @override
  void initState() {
    getPokemonDetail();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return isLoaing ? LoadingPage()   : Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            Text(pokemon[0]['name'], style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            )),
            Padding(padding: EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.2),
              child: Text('#${pokemon[0]['id'].toString()}',style: TextStyle(
                color: Color(0XFFFFFFFF),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ) )
              ,)
          ],
        ),
      ),
      body:   Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Padding(padding: EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.4),
                    child: SvgPicture.asset('assets/images/Pokeball_backkground.svg'),),
                ],
              ),
              SizedBox(height: 25,),
              ContainerInfoPokemon(chips: pokemon[0]["abilities"], weight: pokemon[0]['weight'].toString(), Height: pokemon[0]['height'].toString(), power: pokemon[0]['types'], stats: pokemon[0]['stats'],),

            ],
          ),
          Positioned(
              left:MediaQuery.of(context).size.width * 0.2,
              top: MediaQuery.of(context).size.width * 0.1,
              child: SizedBox(width: 250, height: 320,child: Image.network(pokemon[0]['image'], fit: BoxFit.cover),) )
        ],
      ),
    );
  }
}


