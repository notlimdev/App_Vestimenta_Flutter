import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_vestimenta/Login/loginsesion.dart';
import 'package:app_vestimenta/Servicios/conection_firebase.dart';
class Login extends StatelessWidget {
  const Login({super.key});

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
                      children: [
                         Container(
                          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: const Text(
                            'FOLK COSTUME',
                            style: TextStyle(fontSize: 30,
                            fontFamily: 'Ultra',
                            ),
                          ),
                         ),
                         Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: const Text(
                            "Bienvenido Registrate ó Incia Sesión"
                            ),

                         ),
                         SvgPicture.asset('assets/images/Icon_login.svg'),
                         Container(
                          decoration: BoxDecoration(
                              gradient: const  LinearGradient(
                                colors: [
                                  Color.fromARGB(75, 132, 32, 214),
                                  Color.fromARGB(198, 141, 48, 204),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          margin: const  EdgeInsets.fromLTRB(0, 80, 0, 0),
                          width: 300,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginSesion(),
                                ));
                            }, 
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('INICIA SESIÓN'),
                                Icon(Icons.arrow_circle_right_outlined,size: 40,)
                              ],
                            )
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
                              borderRadius: BorderRadius.circular(30)
                          ),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 300,
                          height: 60,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () => getVestEspesific(),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('REGISTRATE'),
                                  Icon(Icons.arrow_circle_right_outlined,size: 40,)
                                ],
                              )),
                        )
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
