import 'package:flutter/material.dart';
import 'package:pokemon_app/presentation/pages/pokemonInfo/widgets/BaseStats.dart';
import 'package:pokemon_app/presentation/pages/pokemonInfo/widgets/about_row.dart';
import 'package:pokemon_app/presentation/pages/pokemonInfo/widgets/chips.dart';

class ContainerInfoPokemon extends StatelessWidget {
  List<String> chips;
  String weight;
  String Height;
  List<String> power;
  var stats;
  ContainerInfoPokemon({super.key, required this.chips, required this.weight, required this.Height, required this.power, required this.stats});



  @override
  Widget build(BuildContext context) {
    return  Container(
      width:MediaQuery.of(context).size.width * 0.90,
      height: 450,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          Chips(typePokemon: chips,),
          Text('About' ,style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.orange
          ),),
          AboutRow(weight: weight, height: Height, powers: power, infoPokemon: '',),
          Container(
            width: 300,
            child: Basestats(powerData: stats,) ,
          )
        ],
      ),
    );
  }
}
