import 'package:flutter/material.dart';

class FormVestiment extends StatelessWidget {
  const FormVestiment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva vestimenta')),
      body: Column(
        children: <Widget>[
          //Expancion de Fondo Gradiente
          Expanded(
            //Contenedor General de Elementos del Home
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0x8659DAFF),
                  Color(0x4CAF50FF),
                  Color(0xC7BB57FF),
                  Color(0x1287E1FF),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              )),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.amberAccent,
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
