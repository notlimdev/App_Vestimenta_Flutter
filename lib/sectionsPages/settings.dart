import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      // Track color when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return Colors.amber;
      }
      // Otherwise return null to set default track color
      // for remaining states such as when the switch is
      // hovered, focused, or disabled.
      return null;
    },
  );

  final MaterialStateProperty<Color?> overlayColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      // Material color when switch is selected.
      if (states.contains(MaterialState.selected)) {
        return Colors.amber.withOpacity(0.54);
      }
      // Material color when switch is disabled.
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      // Otherwise return null to set default material color
      // for remaining states such as when the switch is
      // hovered, or focused.
      return null;
    },
  );

  bool light = true;
  bool messajes = true;

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
                  Color.fromARGB(133, 57, 22, 68),
                  Color.fromARGB(216, 93, 144, 211),
                  Color.fromARGB(108, 88, 65, 109),
                  Color.fromARGB(197, 177, 136, 201),
                  Color.fromARGB(216, 93, 144, 211),
                  Color.fromARGB(202, 235, 239, 240),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              )),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(186, 217, 217, 217),
                                Color.fromARGB(131, 180, 137, 250),
                                Color.fromARGB(141, 175, 130, 253),
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                          width: 340,
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(Icons.settings),
                              const Text("Configuración General."),
                              Container(
                                height: 30,
                                width: 30,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                              width: 340,
                              height: 120,
                              //color: Colors.blueGrey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "App",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 340,
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 340,
                                        //color: Colors.blue,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Icon(
                                                Icons.remove_red_eye_outlined),
                                            const Text(
                                              "Tema Claro",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Switch(
                                              value: light,
                                              overlayColor: overlayColor,
                                              trackColor: trackColor,
                                              thumbColor:
                                                  const MaterialStatePropertyAll<
                                                      Color>(Colors.black),
                                              onChanged: (bool value) {
                                                // This is called when the user toggles the switch.
                                                setState(() {
                                                  light = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 340,
                                        //color: Colors.blue,
                                        child:  Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(Icons.mediation),
                                            Text(
                                              "Versión",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text("Versión preliminar 1.0 GTDP",
                                                style: TextStyle(fontSize: 9)),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                              width: 340,
                              height: 120,
                              //color: Colors.blueGrey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Notificaciones",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ],
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 340,
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 340,
                                        //color: Colors.blue,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Icon(
                                                Icons.notifications_active),
                                            const Text(
                                              "Mensajes",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Switch(
                                              value: messajes,
                                              overlayColor: overlayColor,
                                              trackColor: trackColor,
                                              thumbColor:
                                                  const MaterialStatePropertyAll<
                                                      Color>(Colors.black),
                                              onChanged: (bool value) {
                                                // This is called when the user toggles the switch.
                                                setState(() {
                                                  messajes = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                              width: 340,
                              height: 200,
                              //color: Colors.blueGrey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Seguridad y Privacidad",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ],
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 340,
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 340,
                                        //color: Colors.blue,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Icon(Icons
                                                .download_for_offline_sharp),
                                            const Text(
                                              "Descargar Datos",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons
                                                    .arrow_forward_ios)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 340,
                                        //color: Colors.blue,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Icon(
                                                Icons.sensor_occupied_outlined),
                                            const Text(
                                              "Actividad Inicio de Session",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons
                                                    .arrow_forward_ios)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 340,
                                        //color: Colors.blue,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Icon(
                                                Icons.people_alt_outlined),
                                            const Text(
                                              "Correos Autorizados de Sesión",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons
                                                    .arrow_forward_ios)),
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
                      ),
                    ],
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
