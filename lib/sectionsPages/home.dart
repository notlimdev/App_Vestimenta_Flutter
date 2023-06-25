import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seccción Principal'),
      ),
      body: 
      Column(
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
              child:  Stack(
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
                                Color.fromARGB(177, 182, 127, 228),
                                Color.fromARGB(150, 181, 113, 226),
                                Color.fromARGB(124, 169, 79, 221),  
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                            ),
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  // Parte Incial Superior del card Home
                                  Container(
                                    key: key,
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
                                                  fontStyle:
                                                      FontStyle.normal,
                                                  fontSize: 30),
                                            ),
                                            Text(
                                              'Benvenido a tu panel Administrativo.',
                                            ),
                                          ],
                                        ),
                                        Container(
                                          key: key,
                                          child: const Text('dms'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //parte medio superior  del card de Home
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    decoration:BoxDecoration(
                                      gradient:const  LinearGradient(
                                        colors: [
                                          Color.fromARGB(133, 89, 147, 255),
                                          Color.fromARGB(204, 103, 11, 179),
                                          Color.fromARGB(188, 82, 9, 131),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(20.0),
                                    ),
                                    child:const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(Icons.lightbulb_outlined,size: 30,color: Colors.white),
                                            Text('10',style: TextStyle(fontSize: 30,color: Colors.white)),
                                            Column(
                                              children: [
                                                Text('Trajes Alquilados',style: TextStyle(color: Colors.white),),
                                                Text(
                                                      'Revisa Tu lista de pedidos',
                                                    style: TextStyle(
                                                        color: Colors.white),),
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
                                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        key: key,
                                        child: CircularPercentIndicator(
                                            radius: 60.0,
                                            lineWidth: 20.0,
                                            percent: 0.8,
                                            // Diseño texto del Progress Bar
                                            center: Container(
                                              key: key,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        key: key,
                                                        child: const Text('20',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    30.0)),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Container(
                                                        key: key,
                                                        child: const  Text(
                                                            'Disponibles'),
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                            progressColor: const  Color.fromARGB(
                                                183, 181, 7, 204),
                                            circularStrokeCap: CircularStrokeCap.round,
                                        ), 
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
                          key: key,
                          //color: Colors.green,
                          margin: EdgeInsets.all(10),
                          child: 
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors:[
                                        Color(0x8659DAFF),
                                        Color(0x4CAF50FF),
                                        Color(0xC7BB57FF),
                                        Color(0x1287E1FF),  
                                      ],
                                      begin: Alignment.topCenter,
                                      end:  Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(30))
                  
                                  ),
                                  
                                  width: 150,
                                  height: 150,
                                  child: const Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                           Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                height: 60,
                                                //color: Colors.blueAccent,
                                                child: Center(
                                                  child: Icon(Icons.hourglass_bottom_sharp,size: 45),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 70,
                                                height: 60,
                                                //color: Colors.blueAccent,
                                                child:Center(
                                                  child: Text('03',style: TextStyle(fontSize: 40),),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 140,
                                            height: 60,
                                            //color: Colors.cyan,
                                            child: Stack(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text('VESTIMENTAS',style: TextStyle(fontSize: 15),),
                                                    Text('PENDIENTES')
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
                                    borderRadius: BorderRadius.all(Radius.circular(30))
                                  ),
                                  width: 150,
                                  height: 150,
                                  child:  const Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                height: 60,
                                                //color: Colors.blueAccent,
                                                child: Center(
                                                  child: Icon(Icons.check_box_rounded,size: 40),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 70,
                                                height: 60,
                                                //color: Colors.blueAccent,
                                                child: Center(
                                                  child: Text('20',style: TextStyle(fontSize: 30),),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 140,
                                            height: 60,
                                            //color: Colors.cyan,
                                            child:Stack(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text('VESTIMENTAS',style: TextStyle(fontSize: 15),),
                                                    Text('ENTREGADAS')
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    borderRadius: BorderRadius.all(Radius.circular(30))
                                  ),
                                  width: 150,
                                  height: 150,
                                  child: const  Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                height: 60,
                                                //color: Colors.blueAccent,
                                                child:  Center(
                                                  child: Icon(Icons.cancel_outlined,size: 45),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 70,
                                                height: 60,
                                                //color: Colors.blueAccent,
                                                child: Center(
                                                  child: Text('05',style: TextStyle(fontSize: 40),),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 140,
                                            height: 60,
                                            //color: Colors.cyan,
                                            child: Stack(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text('VESTIMENTAS',style: TextStyle(fontSize: 15),),
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
                                    borderRadius: BorderRadius.all(Radius.circular(30))
                                  ),
                                  width: 150,
                                  height: 150,
                                  child:  const Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                height: 60,
                                                //color: Colors.blueAccent,
                                                child: Center(
                                                  child: Icon(Icons.delete_forever_rounded,size: 45),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 70,
                                                height: 60,
                                                //color: Colors.blueAccent,
                                                child: Center(
                                                  child: Text('03',style: TextStyle(fontSize: 40),),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 140,
                                            height: 60,
                                            //color: Colors.cyan,
                                            child:Stack(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text('VESTIMENTAS',style: TextStyle(fontSize: 15),),
                                                    Text('ELIMINADAS')
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
