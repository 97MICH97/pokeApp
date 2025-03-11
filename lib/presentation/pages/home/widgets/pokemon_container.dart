import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonContainer extends StatelessWidget {
  final String numberPokemon;
  final String imagePokemon;
  final String namePokemon;
  const PokemonContainer({super.key, required this.numberPokemon, required this.imagePokemon, required this.namePokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 104,
      height: 118,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              1.0,
              1.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(left:50,),
          child: Text(numberPokemon, style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400),)),
          Expanded(child: Image.network(imagePokemon)),
          Padding(padding: EdgeInsets.only(top:0),
          child: Text(namePokemon, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),),),
        ],
      ),
    );
  }
}
