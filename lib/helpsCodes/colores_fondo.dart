import 'package:flutter/material.dart';

class PaintWall extends StatelessWidget {
  const PaintWall({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            colors: [

              Color.fromARGB(255, 149, 18, 182),
              Color.fromARGB(211, 204, 198, 209),
             
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

      ),
    );
  }



}