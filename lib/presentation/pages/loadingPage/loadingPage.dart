import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFDC0A2D)
      ),
      child: Center(child:
        Image.network('https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExcGFpbmE1aXF5M2cyZGF0ZmZhNHl2MDhnbnl5d3ZxamRoOGNxYmNraCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/IQebREsGFRXmo/giphy.gif')       
        ));
  }
}