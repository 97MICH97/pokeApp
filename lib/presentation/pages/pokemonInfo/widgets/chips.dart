import 'package:flutter/material.dart';

class Chips extends StatelessWidget {
   List<String> typePokemon = [];
   Chips({super.key, required this.typePokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top:60, bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(var item in typePokemon)
              Padding(padding: EdgeInsets.all(3),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green
                ),
                child:Padding(padding: EdgeInsets.all(5),
                    child: Text(item),) ,
              ),)
          ],
        ));
  }
}
