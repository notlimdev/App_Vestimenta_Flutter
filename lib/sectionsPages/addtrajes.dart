import 'package:flutter/material.dart';
import 'package:app_vestimenta/FormView/form_vestimentas.dart';

class AddVestments extends StatelessWidget {
  const AddVestments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Añadir'),),
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
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 149, 18, 182),
                                Color.fromARGB(211, 204, 198, 209),
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50.0),
                                  bottomLeft: Radius.circular(200.0),
                                  topLeft: Radius.circular(50.0),
                                  topRight: Radius.circular(50.0)),
                            ),
                            margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                            height: 200,
                            width: 360,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                     Text(
                                        'Agrega Tus Procesos'),
                                     Text('que Creas Conveniente')
                                  ],
                                ),
                                Center(
                                  child: Container(
                                    key: key,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.elliptical(70.0, 70.0)),
                                          ),
                                          height: 80,
                                          width: 80,
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.purple.shade700,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.elliptical(
                                                                40.0, 40.0)),
                                                  ),
                                                  height: 60,
                                                  width: 60,
                                                  child: Stack(
                                                    children: [
                                                      Center(
                                                          child: SizedBox(
                                                        width: 40,
                                                        height: 40,
                                                        child:
                                                            FloatingActionButton(
                                                          backgroundColor:
                                                              Colors.black,
                                                          onPressed: () {},
                                                          child: const Icon(Icons
                                                              .add_circle_outline),
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 100,
                                          width: 150,
                                          //color: Colors.deepOrange,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.fromLTRB(
                                                    10.0, 10.0, 0, 0),
                                                //color: Colors.green,
                                                child: const Text(
                                                  'Añade',
                                                  style: TextStyle(fontSize: 30),
                                                ),
                                              ),
                                              const Text(
                                                'Nueva Categoría',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        //color: Colors.brown,
                                        margin:
                                            const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                        height: 30,
                                        width: 100,
                                        child: const Text('20/06/2023'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            key: key,
                            margin: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Center(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      //color: Colors.orange,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30.0)),
                                    ),
                                    height: 460,
                                    width: 360,
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                gradient: LinearGradient(colors: [
                                                  Color.fromARGB(
                                                      255, 130, 23, 156),
                                                  Color.fromARGB(
                                                      248, 45, 181, 185),
                                                  Color.fromARGB(248, 201, 12, 91)
                                                ]),
                                                color: Colors.purple,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 20, 0, 0),
                                            width: 250,
                                            height: 130,
                                            child: Stack(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                      colors: [
                                                                    Color
                                                                        .fromARGB(
                                                                            255,
                                                                            139,
                                                                            100,
                                                                            26),
                                                                    Color
                                                                        .fromARGB(
                                                                            248,
                                                                            194,
                                                                            182,
                                                                            17),
                                                                    Color
                                                                        .fromARGB(
                                                                            248,
                                                                            12,
                                                                            201,
                                                                            169)
                                                                  ]),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              30))),
                                                      margin: const EdgeInsets
                                                          .fromLTRB(0, 8.0, 0, 0),
                                                      height: 110,
                                                      width: 250,
                                                      child: Stack(
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    const BoxDecoration(
                                                                        gradient: LinearGradient(
                                                                            colors: [
                                                                              Color.fromARGB(
                                                                                  255,
                                                                                  113,
                                                                                  148,
                                                                                  73),
                                                                              Color.fromARGB(
                                                                                  248,
                                                                                  123,
                                                                                  138,
                                                                                  96),
                                                                              Color.fromARGB(
                                                                                  248,
                                                                                  12,
                                                                                  201,
                                                                                  169),
                                                                            ],
                                                                            begin: Alignment
                                                                                .topCenter,
                                                                            end: Alignment
                                                                                .bottomCenter),
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(30))),
                                                                height: 90,
                                                                width: 250,
                                                                child: Stack(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .center,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                decoration: const BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                                                                  gradient: LinearGradient(
                                                                                    colors: [
                                                                                      Color.fromARGB(255, 25, 152, 168),
                                                                                      Color.fromARGB(248, 156, 217, 238),
                                                                                      Color.fromARGB(101, 191, 227, 240),
                                                                                      Color.fromARGB(248, 95, 27, 139),
                                                                                    ],
                                                                                    begin: Alignment.centerLeft,
                                                                                    end: Alignment.centerRight,
                                                                                  ),
                                                                                  //color: Colors.teal,
                                                                                  //borderRadius: BorderRadius.all(Radius.circular(30))
                                                                                ),
                                                                                height: 50,
                                                                                width: 200,
                                                                                child: ElevatedButton(
                                                                                  onPressed: () {
                                                                                    Navigator.of(context).push(MaterialPageRoute(
                                                                                      builder: (context) => const FormVestiment(),
                                                                                    ));
                                                                                  },
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    backgroundColor: Colors.transparent,
                                                                                    shadowColor: Colors.transparent,
                                                                                    shape: const StadiumBorder(),
                                                                                  ),
                                                                                  child: const Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      Icon(Icons.add_card_rounded, color: Colors.black),
                                                                                      Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Text('Nuevas',
                                                                                              style: TextStyle(
                                                                                                color: Colors.black,
                                                                                              )),
                                                                                          Text('Vestimentas',
                                                                                              style: TextStyle(
                                                                                                color: Colors.black,
                                                                                              )),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                gradient: LinearGradient(colors: [
                                                  Color.fromARGB(
                                                      255, 130, 23, 156),
                                                  Color.fromARGB(
                                                      248, 45, 181, 185),
                                                  Color.fromARGB(248, 201, 12, 91)
                                                ]),
                                                color: Colors.purple,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 20, 0, 0),
                                            width: 250,
                                            height: 130,
                                            child: Stack(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                      colors: [
                                                                    Color
                                                                        .fromARGB(
                                                                            255,
                                                                            139,
                                                                            100,
                                                                            26),
                                                                    Color
                                                                        .fromARGB(
                                                                            248,
                                                                            194,
                                                                            182,
                                                                            17),
                                                                    Color
                                                                        .fromARGB(
                                                                            248,
                                                                            12,
                                                                            201,
                                                                            169)
                                                                  ]),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              30))),
                                                      margin: const EdgeInsets
                                                          .fromLTRB(0, 8.0, 0, 0),
                                                      height: 110,
                                                      width: 250,
                                                      child: Stack(
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    const BoxDecoration(
                                                                        gradient: LinearGradient(
                                                                            colors: [
                                                                              Color.fromARGB(
                                                                                  255,
                                                                                  113,
                                                                                  148,
                                                                                  73),
                                                                              Color.fromARGB(
                                                                                  248,
                                                                                  123,
                                                                                  138,
                                                                                  96),
                                                                              Color.fromARGB(
                                                                                  248,
                                                                                  12,
                                                                                  201,
                                                                                  169),
                                                                            ],
                                                                            begin: Alignment
                                                                                .topCenter,
                                                                            end: Alignment
                                                                                .bottomCenter),
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(30))),
                                                                height: 90,
                                                                width: 250,
                                                                child: Stack(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .center,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                decoration: const BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                                                                  gradient: LinearGradient(
                                                                                    colors: [
                                                                                      Color.fromARGB(255, 25, 152, 168),
                                                                                      Color.fromARGB(248, 156, 217, 238),
                                                                                      Color.fromARGB(101, 191, 227, 240),
                                                                                      Color.fromARGB(248, 95, 27, 139),
                                                                                    ],
                                                                                    begin: Alignment.centerLeft,
                                                                                    end: Alignment.centerRight,
                                                                                  ),
                                                                                  //color: Colors.teal,
                                                                                  //borderRadius: BorderRadius.all(Radius.circular(30))
                                                                                ),
                                                                                height: 50,
                                                                                width: 200,
                                                                                child: ElevatedButton(
                                                                                  onPressed: () {},
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    backgroundColor: Colors.transparent,
                                                                                    shadowColor: Colors.transparent,
                                                                                    shape: const StadiumBorder(),
                                                                                  ),
                                                                                  child: const Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      Icon(Icons.add_card, color: Colors.black),
                                                                                      Text('Nuevos ', style: TextStyle(color: Colors.black)),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                gradient: LinearGradient(colors: [
                                                  Color.fromARGB(
                                                      255, 130, 23, 156),
                                                  Color.fromARGB(
                                                      248, 45, 181, 185),
                                                  Color.fromARGB(248, 201, 12, 91)
                                                ]),
                                                color: Colors.purple,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 20, 0, 0),
                                            width: 250,
                                            height: 130,
                                            child: Stack(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                      colors: [
                                                                    Color
                                                                        .fromARGB(
                                                                            255,
                                                                            139,
                                                                            100,
                                                                            26),
                                                                    Color
                                                                        .fromARGB(
                                                                            248,
                                                                            194,
                                                                            182,
                                                                            17),
                                                                    Color
                                                                        .fromARGB(
                                                                            248,
                                                                            12,
                                                                            201,
                                                                            169)
                                                                  ]),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              30))),
                                                      margin: const EdgeInsets
                                                          .fromLTRB(0, 8.0, 0, 0),
                                                      height: 110,
                                                      width: 250,
                                                      child: Stack(
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    const BoxDecoration(
                                                                        gradient: LinearGradient(
                                                                            colors: [
                                                                              Color.fromARGB(
                                                                                  255,
                                                                                  113,
                                                                                  148,
                                                                                  73),
                                                                              Color.fromARGB(
                                                                                  248,
                                                                                  123,
                                                                                  138,
                                                                                  96),
                                                                              Color.fromARGB(
                                                                                  248,
                                                                                  12,
                                                                                  201,
                                                                                  169),
                                                                            ],
                                                                            begin: Alignment
                                                                                .topCenter,
                                                                            end: Alignment
                                                                                .bottomCenter),
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(30))),
                                                                height: 90,
                                                                width: 250,
                                                                child: Stack(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .center,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                decoration: const BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                                                                  gradient: LinearGradient(
                                                                                    colors: [
                                                                                      Color.fromARGB(255, 25, 152, 168),
                                                                                      Color.fromARGB(248, 156, 217, 238),
                                                                                      Color.fromARGB(101, 191, 227, 240),
                                                                                      Color.fromARGB(248, 95, 27, 139),
                                                                                    ],
                                                                                    begin: Alignment.centerLeft,
                                                                                    end: Alignment.centerRight,
                                                                                  ),
                                                                                  //color: Colors.teal,
                                                                                  //borderRadius: BorderRadius.all(Radius.circular(30))
                                                                                ),
                                                                                height: 50,
                                                                                width: 200,
                                                                                child: ElevatedButton(
                                                                                  onPressed: () {},
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    backgroundColor: Colors.transparent,
                                                                                    shadowColor: Colors.transparent,
                                                                                    shape: const StadiumBorder(),
                                                                                  ),
                                                                                  child: const Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      Icon(Icons.add_card, color: Colors.black),
                                                                                      Text(
                                                                                        'Nuevos Trajes',
                                                                                        style: TextStyle(color: Colors.black),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
