import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:app_vestimenta/Servicios/conection_firebase.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dataClientes = getClientes();
  final datass = getPedidos();
  final datavestimentas = getVestimentas();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seccción Principal'),
      ),
      body: Column(
        children: <Widget>[
          //Expancion de Fondo Gradiente
          Expanded(
            //Contenedor General de Elementos del Home
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(133, 36, 124, 206),
                  Color.fromARGB(75, 186, 146, 219),
                  Color.fromARGB(197, 207, 174, 230),
                  Color.fromARGB(18, 146, 186, 199),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              )),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      //Decoracion del card general Color verde
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(133, 89, 147, 255),
                                  Color.fromARGB(197, 183, 127, 228),
                                  Color.fromARGB(178, 181, 113, 226),
                                  Color.fromARGB(171, 169, 79, 221),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100.0),
                                topLeft: Radius.circular(50.0),
                                topRight: Radius.circular(50.0)),
                          ),
                          margin: const EdgeInsets.all(8.0),
                          width: 350,
                          height: 300,
                          //columna general de Elementos de card Superior
                          child: Center(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // Parte Incial Superior del card Home
                                  Container(
                                    key: UniqueKey(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Hola María',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 30),
                                            ),
                                            Text(
                                              'Benvenido a',
                                            ),
                                            Text(
                                              ' Tu panel Administrativo.',
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 90,
                                          width: 90,
                                          padding: const EdgeInsets.all(5),
                                          child: CircleAvatar(
                                            child: SvgPicture.asset('assets/images/prevperfil.svg'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //parte medio superior  del card de Home
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          colors: [
                                            Color.fromARGB(133, 89, 147, 255),
                                            Color.fromARGB(204, 103, 11, 179),
                                            Color.fromARGB(188, 82, 9, 131),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(Icons.lightbulb_outlined,
                                                size: 30, color: Colors.white),
                                            Text('10',
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white)),
                                            Column(
                                              children: [
                                                Text(
                                                  'Trajes Alquilados',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  'Revisa Tu lista de pedidos',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Fila de Progress bar  Porque quiero que vaya a la derecha.
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: FutureBuilder<int>(
                                            future:
                                                contarElementosFuture(datass),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<int> snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const CircularProgressIndicator();
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else {
                                                final porcentaje = (50 -
                                                        snapshot.data!
                                                            .toInt()) /
                                                    50 *
                                                    100;
                                                return CircularPercentIndicator(
                                                  animation: true,
                                                  animationDuration: 1000,
                                                  radius: 60.0,
                                                  lineWidth: 20.0,
                                                  percent: 0.8,
                                                  // Diseño texto del Progress Bar
                                                  center: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            '$porcentaje%',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        20),
                                                          ),
                                                        ),
                                                      ]),
                                                  progressColor:
                                                      const Color.fromARGB(
                                                          183, 181, 7, 204),
                                                  circularStrokeCap:
                                                      CircularStrokeCap.round,
                                                );
                                              }
                                            }),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Container de Elementos card Inferior
                      Center(
                        child: Container(
                          //color: Colors.green,
                          margin: const EdgeInsets.all(10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x8659DAFF),
                                              Color(0x4CAF50FF),
                                              Color(0xC7BB57FF),
                                              Color(0x1287E1FF),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      width: 150,
                                      height: 150,
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    width: 70,
                                                    height: 60,
                                                    //color: Colors.blueAccent,
                                                    child: Center(
                                                      child: Icon(
                                                          Icons
                                                              .dry_cleaning,
                                                          size: 45),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 70,
                                                    height: 60,
                                                    //color: Colors.blueAccent,
                                                    child: Center(
                                                      child: FutureBuilder<int>(
                                                          future:
                                                              contarElementosFuture(
                                                                  datavestimentas),
                                                          builder: (BuildContext
                                                                  context,
                                                              AsyncSnapshot<int>
                                                                  snapshot) {
                                                            if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return const CircularProgressIndicator();
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return Text(
                                                                  'Error: ${snapshot.error}');
                                                            } else {
                                                              final cantidadpedidos =
                                                                  snapshot.data;
                                                              return Text(
                                                                cantidadpedidos
                                                                    .toString()
                                                                    .padLeft(
                                                                        2, '0'),
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            40),
                                                              );
                                                            }
                                                          }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 140,
                                                height: 60,
                                                //color: Colors.cyan,
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'VESTIMENTAS',
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                        Text('AGREGADAS')
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x8659DAFF),
                                              Color(0x4CAF50FF),
                                              Color(0xC7BB57FF),
                                              Color(0x1287E1FF),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      width: 150,
                                      height: 150,
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    width: 70,
                                                    height: 60,
                                                    //color: Colors.blueAccent,
                                                    child: Center(
                                                      child: Icon(
                                                          Icons
                                                              .check_box_rounded,
                                                          size: 40),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 70,
                                                    height: 60,
                                                    //color: Colors.blueAccent,
                                                    child: Center(
                                                      child: FutureBuilder<int>(
                                                          future:
                                                              contarElementosFuture(
                                                                  datass),
                                                          builder: (BuildContext
                                                                  context,
                                                              AsyncSnapshot<int>
                                                                  snapshot) {
                                                            if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return const CircularProgressIndicator();
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return Text(
                                                                  'Error: ${snapshot.error}');
                                                            } else {
                                                              final cantidadpedidos =
                                                                  snapshot.data;
                                                              return Text(
                                                                cantidadpedidos
                                                                    .toString()
                                                                    .padLeft(
                                                                        2, '0'),
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            40),
                                                              );
                                                            }
                                                          }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Center(
                                                child: SizedBox(
                                                  width: 140,
                                                  height: 60,
                                                  //color: Colors.cyan,
                                                  child: Stack(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            'PEDIDOS',
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                          Text('ENTREGADOS')
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x8659DAFF),
                                              Color(0x4CAF50FF),
                                              Color(0xC7BB57FF),
                                              Color(0x1287E1FF),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      width: 150,
                                      height: 150,
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    width: 70,
                                                    height: 60,
                                                    //color: Colors.blueAccent,
                                                    child: Center(
                                                      child: Icon(
                                                          Icons.monetization_on_outlined,
                                                          size: 45),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 70,
                                                    height: 60,
                                                    //color: Colors.blueAccent,
                                                    child: Center(
                                                      child: FutureBuilder<int>(
                                                          future:
                                                              contarElementosFuture(
                                                                  datass),
                                                          builder: (BuildContext
                                                                  context,
                                                              AsyncSnapshot<int>
                                                                  snapshot) {
                                                            if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return const CircularProgressIndicator();
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return Text(
                                                                  'Error: ${snapshot.error}');
                                                            } else {
                                                              final cantidadpedidos =
                                                                  snapshot.data;
                                                              return Text(
                                                                cantidadpedidos
                                                                    .toString()
                                                                    .padLeft(
                                                                        2, '0'),
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            40),
                                                              );
                                                            }
                                                          }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 140,
                                                height: 60,
                                                //color: Colors.cyan,
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'VESTIMENTAS',
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                        Text('CANCELADAS')
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x8659DAFF),
                                              Color(0x4CAF50FF),
                                              Color(0xC7BB57FF),
                                              Color(0x1287E1FF),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      width: 150,
                                      height: 150,
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    width: 70,
                                                    height: 60,
                                                    //color: Colors.blueAccent,
                                                    child: Center(
                                                      child: Icon(
                                                          Icons
                                                              .people,
                                                          size: 45),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 70,
                                                    height: 60,
                                                    //color: Colors.blueAccent,
                                                    child: Center(
                                                      child: FutureBuilder<int>(
                                                          future:
                                                              contarElementosFuture(
                                                                  dataClientes),
                                                          builder: (BuildContext
                                                                  context,
                                                              AsyncSnapshot<int>
                                                                  snapshot) {
                                                            if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return const CircularProgressIndicator();
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return Text(
                                                                  'Error: ${snapshot.error}');
                                                            } else {
                                                              final cantidadpedidos =
                                                                  snapshot.data;
                                                              return Text(
                                                                cantidadpedidos
                                                                    .toString()
                                                                    .padLeft(
                                                                        2, '0'),
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            40),
                                                              );
                                                            }
                                                          }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 140,
                                                height: 60,
                                                //color: Colors.cyan,
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'CLIENTES',
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                        Text('AGREGADOS')
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ]),
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
