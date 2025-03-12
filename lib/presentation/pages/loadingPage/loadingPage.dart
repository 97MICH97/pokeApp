import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFDC0A2D)
      ),
      child: Center(child: CircularProgressIndicator(color: Color(0XFFFFFFFF),)),
    );
  }
}