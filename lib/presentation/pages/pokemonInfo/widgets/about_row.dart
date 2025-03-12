import 'package:flutter/material.dart';

class AboutRow extends StatelessWidget {
  final String weight;
  final String height;
  List<String> powers = [];
  final String infoPokemon;
   AboutRow({super.key, required this.weight, required this.height, required this.powers, required this.infoPokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.speed),
            Text('${weight} kg  \nWeight'),
            const VerticalDivider( thickness: 5, color: Colors.black),
            Icon(Icons.height),
            Text('${height} m  \nHeight'),
            const VerticalDivider( thickness: 5, color: Colors.black),
            for(var item in powers)
              Text('${item} \n')
            ,
          ],
        ),
        SizedBox(height: 30,),
        Container(
          width: 300,
          child: Text(infoPokemon,style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),),
        )

      ],
    );
  }
}
