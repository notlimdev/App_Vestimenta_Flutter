import 'package:flutter/material.dart';
import 'package:app_vestimenta/Servicios/conection_firebase.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ListaDataClientes extends StatefulWidget {
  const ListaDataClientes({super.key});

  @override
  State<ListaDataClientes> createState() => _ListaDataClientesState();
}

class _ListaDataClientesState extends State<ListaDataClientes> {
  final ScrollController _firstController = ScrollController();

  bool filledSelected = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getclientesespecific(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.hasError) {
              AlertController.show("Datos No Disponibles", "Error de Servidor!",
                  TypeAlert.error);
            }
            return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                children: <Widget>[
                  SizedBox(
                      width: constraints.maxWidth,
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: _firstController,
                        child: ListView.builder(
                            controller: _firstController,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(242, 17, 157, 221),
                                        Color.fromARGB(185, 242, 242, 243),
                                      ],
                                      // begin: Alignment.bottomLeft,
                                      // end: Alignment.bottomRight
                                    ),
                                  ),
                                  height: 80,
                                  margin: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(Icons.emoji_people_rounded,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 6, 143, 17)),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              snapshot.data?[index]['nombres'],
                                              style: const TextStyle(
                                                  fontFamily: 'Ultra',
                                                  fontSize: 10)),
                                          Row(
                                            children: [
                                              const Icon(Icons.phone_android,
                                                  size: 10),
                                              Text(
                                                snapshot.data?[index]
                                                    ['telefono'],
                                                style: const TextStyle(
                                                    fontSize: 8),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      FloatingActionButton.small(
                                        heroTag: UniqueKey(),
                                        elevation: 3,
                                        onPressed: () async {
                                          Alert(
                                              context: context,
                                              title: 'Datos del Cliente',
                                              content: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          const Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .near_me),
                                                              Text('Nombres: '),
                                                            ],
                                                          ),
                                                          Text(snapshot
                                                                  .data?[index]
                                                              ['nombres'])
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          const Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .near_me),
                                                              Text(
                                                                  'Apellidos: '),
                                                            ],
                                                          ),
                                                          Text(snapshot
                                                                  .data?[index]
                                                              ['apellidos']),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.credit_card),
                                                      Column(
                                                        children: [
                                                          const Text('DNI:'),
                                                          Text(snapshot
                                                                  .data?[index]
                                                              ['dni']),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.phone_android),
                                                      Column(
                                                        children: [
                                                          const Text(
                                                              'Teléfono:'),
                                                          Text(snapshot
                                                                  .data?[index]
                                                              ['telefono']),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              buttons: [
                                                DialogButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text(
                                                    "Cerrar",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                )
                                              ]).show();
                                        },
                                        child: const Icon(
                                            Icons.remove_red_eye_outlined),
                                      ),
                                      FloatingActionButton.small(
                                        heroTag: UniqueKey(),
                                        elevation: 3,
                                        onPressed: () async {
                                          await Navigator.pushNamed(
                                              context, "/editformcliente",
                                              arguments: {
                                                'idkey': snapshot.data?[index]
                                                    ['idkey'],
                                                'nombres': snapshot.data?[index]
                                                    ['nombres'],
                                                'apellidos': snapshot
                                                    .data?[index]['apellidos'],
                                                'dni': snapshot.data?[index]
                                                    ['dni'],
                                                'telefono': snapshot
                                                    .data?[index]['telefono']
                                              });
                                        },
                                        child: const Icon(Icons.edit_document),
                                      ),
                                      FloatingActionButton.small(
                                        heroTag: UniqueKey(),
                                        elevation: 3,
                                        onPressed: () async {
                                          await Alert(
                                            context: context,
                                            type: AlertType.warning,
                                            title: "!Estas Seguro de eliminar a?.",
                                            desc: snapshot.data?[index]
                                                ['nombres'],
                                            buttons: [
                                              DialogButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                color: const Color.fromRGBO(
                                                    0, 179, 134, 1.0),
                                                child: const Text(
                                                  "No, Cancelar",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              DialogButton(
                                                onPressed: () async {
                                                  await deletecliente(
                                                          snapshot.data?[index]
                                                              ['idkey'])
                                                      .then((value) {
                                                    Navigator.pop(context);
                                                  });

                                                  setState(() {
                                                    snapshot.data
                                                        ?.removeAt(index);
                                                  });
                                                },
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color.fromRGBO(
                                                          116, 116, 191, 1.0),
                                                      Color.fromRGBO(
                                                          52, 138, 199, 1.0)
                                                    ]),
                                                child: const Text(
                                                  "Si, Eliminar",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              )
                                            ],
                                          ).show();
                                        },
                                        child: const Icon(
                                            Icons.delete_forever_rounded),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )),
                ],
              );
            });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
