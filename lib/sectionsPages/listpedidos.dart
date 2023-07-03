import 'package:flutter/material.dart';

import '../CodPruebas/listasrcl.dart';

class ListOrders extends StatefulWidget {
  const ListOrders({super.key});
  @override
  State<ListOrders> createState() => _ListOrdersState();
}
class _ListOrdersState extends State<ListOrders> {


  bool filledSelected = false;
@override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Trajes Y Pedidos'),
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
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                            width: 360,
                            height: 70,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(151, 89, 219, 255),
                                  Color.fromARGB(174, 98, 5, 173),
                                  
                                ],
                                 begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 330,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                              Color(0x4CAF50FF),
                                              Color(0xC7BB57FF),
                                              ]
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                            
                                          ),
                                          child: Stack(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: [
                                                                Colors.pinkAccent,
                                                                Colors.purple
                                                              ]),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      20.0)),
                                                        ),
                                                        height: 30,
                                                        width: 90,
                                                        child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: Colors.transparent,
                                                            shadowColor: Colors.transparent,
                                                            shape: const StadiumBorder(),
                                                           ),
                                                          onPressed: () {},
                                                          child: const Text(
                                                              'Trajes'),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: [
                                                                Colors.pinkAccent,
                                                                Colors.purple
                                                              ]),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      20.0)),
                                                        ),
                                                        height: 30,
                                                        width: 100,
                                                        child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom (
                                                            backgroundColor: Colors.transparent,
                                                            shadowColor: Colors.transparent,
                                                            shape: const StadiumBorder(),
                                                          ),
                                                          onPressed: () {},
                                                          child: const Text(
                                                              'Pedidos'),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: [
                                                                Colors.pinkAccent,
                                                                Colors.purple
                                                              ]),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      20.0)),
                                                        ),
                                                        height: 30,
                                                        width: 90,
                                                        child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: Colors.transparent,
                                                          shadowColor: Colors.transparent,
                                                          shape: const StadiumBorder(),
                                                        ),
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Others'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                            width: 360,
                            height: 620,
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 360,
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(171, 212, 179, 231),
                                            Color.fromARGB(172, 234, 229, 236),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(30))
                                      ),
                                      width: 360,
                                      height: 600,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              const Text('vestimentas agregadas'),
                                              IconButton.filled(
                                              isSelected: filledSelected,
                                                icon: const Icon(
                                                    Icons.settings_outlined),
                                                selectedIcon:
                                                    const Icon(Icons.settings),
                                                onPressed: () {
                                                  setState(() {
                                                    filledSelected =
                                                        !filledSelected;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 320,
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            width: 350,
                                            height: 420,
                                            //color: Colors.cyan,
                                            child:ListaPedidosSrcl(),
                                          ),
                                          Container(
                                            width: 320,
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                  width: 120,
                                                  height: 20,
                                                  child: Text('Mostrando ..'),
                                                ),
                                                SizedBox(
                                                  width: 120,
                                                  height: 20,
                                                  child: Text('1-10 Registros'),
                                                ),
                                              ]),
                                        ],
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ],
                            ),
                          ),
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
