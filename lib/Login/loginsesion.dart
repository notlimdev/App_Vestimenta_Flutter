import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginSesion extends StatelessWidget {
  const LoginSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'FOLK COSTUME',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Ultra',
                          ),
                        ),
                        SvgPicture.asset('assets/images/logo_sesion.svg'),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(197, 134, 30, 219),
                                Color.fromARGB(198, 159, 76, 214),
                              ]
                            ),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight:Radius.circular(0),topLeft: Radius.circular(20),topRight: Radius.circular(50) ),
                          ),
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 300,
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 15, 8, 20),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    labelStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(),
                                    labelText: 'Ingrese Su Correo',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 30, 8, 0),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                    ),
                                    labelText: 'Ingrese su contraseña',
                                    
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(75, 132, 32, 214),
                                  Color.fromARGB(198, 141, 48, 204),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          width: 300,
                          height: 60,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {},
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('INICIA SESIÓN'),
                                  Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 40,
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
